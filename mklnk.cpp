// Copyright (c) 2005-2015 Ross Smith II. See Mit LICENSE in /LICENSE

/*
todo don't process target arguments as options

rename to mklnk

replace fopen functionality with c++ methods

todo exclude non gui apps
if cli apps are included use wrapper .cmd file:

@echo off
set /p _params=Enter parameters, if any, for %1:
"%~1" %_params%
echo Program returned errorlevel %errorlevel%
pause

*.exe
can create a file to create links from

//Target		Link name	Arguments	Comments	Startup dir	Icon Index	Icon File
//-------------	-----------	----------	-----------	-----------	-----------	---------------------
filename.exe	"Link Name"	"arguments"	"comments"	"c:\ex"		icon.ico	icon_index 	// comments

*/

#ifdef _MSC_VER
#pragma comment(lib, "ole32.lib")
#endif

#ifndef WIN32_LEAN_AND_MEAN
# define WIN32_LEAN_AND_MEAN 1
#endif

// #define _WIN32_WINNT 0x501

#include <windows.h>
//#include <atlbase.h> // required for Stackwalker

#include <cstdio>
#include <iostream>
//#include <conio.h>
#include <stdlib.h>

#include "Stackwalker.h"
#include "Optimize.h"
#include "debug.h"
#include "getopt.h"
#include "SystemMessage.h"

#include "version.hpp"
#include "shlink.h"

#include "version.h"

#define APPNAME			VER_INTERNAL_NAME
#define APPVERSION		VER_STRING2
#define APPCOPYRIGHT	VER_LEGAL_COPYRIGHT

//using namespace std;

struct _opt {
	char	*arguments;
	char	*comment;
	char	*directory;
	char	*link_name;
	int		show;
	char	*icon;
	int		icon_index;
	char	*target_directory;
	int		verbose;
};

// -c "a comment" -d "c:\bin" -s 2 -i c:\cygwin\cygwin.ico -n 0 -a "-t -n" -l ProductName n:\lsdsk\Debug\lsdsk.exe "link name"
typedef struct _opt opt_t;

static opt_t opt = {
	NULL,	// arguments
	NULL,	// comment
	NULL,	// directory
	NULL,	// link_name
	0,		// show
	NULL,	// icon
	0,		// icon_index
	NULL,	// target_directory
	0		// verbose
};

static char *short_options = "a:c:d:i:l:n:s:t:v?";

static struct option long_options[] = {
	{"arguments",				required_argument, 0, 'a'},
	{"args",					required_argument, 0, 'a'},
	{"a",						required_argument, 0, 'a'},

	{"comment",					required_argument, 0, 'c'},
	{"c",						required_argument, 0, 'c'},
	{"description",				required_argument, 0, 'c'},
	{"desc",					required_argument, 0, 'c'},

	{"directory",				required_argument, 0, 'd'},
	{"d",						required_argument, 0, 'd'},

	{"icon",					required_argument, 0, 'i'},
	{"i",						required_argument, 0, 'i'},
	{"ico",						required_argument, 0, 'i'},
	{"dll",						required_argument, 0, 'i'},

	{"icon-no",					required_argument, 0, 'n'},
	{"n",						required_argument, 0, 'n'},
	{"iconno",					required_argument, 0, 'n'},
	{"icon-number",				required_argument, 0, 'n'},
	{"iconnumber",				required_argument, 0, 'n'},
	{"icon-index",				required_argument, 0, 'n'},
	{"iconindex",				required_argument, 0, 'n'},

	{"link-name",				required_argument, 0, 'l'},
	{"l",						required_argument, 0, 'l'},

	{"show",					required_argument, 0, 's'},
	{"s",						required_argument, 0, 's'},
	{"run",						required_argument, 0, 's'},

	{"target-directory",		required_argument, 0, 't'},
	{"t",						required_argument, 0, 't'},
	{"target",					required_argument, 0, 't'},
	{"targetdirectory",			required_argument, 0, 't'},

	{"version",					no_argument, 0, 'v'},
	{"help",					no_argument, 0, '?'},
	{NULL, 0, 0, 0}
};

void usage() {
	printf(
		"Usage: " APPNAME " [options] target.exe [link.lnk] \n"
		"\n"
		" target.exe   Name of target, use quotes if it contains spaces\n"
		" link.lnk     Name of link, use quotes if it contains spaces\n"
		"              Default is to use the target's name\n"
		"\n"
		"Options (defaults in parentheses):\n"

//        1         2         3         4         5         6         7         8
//2345678901234567890123456789012345678901234567890123456789012345678901234567890
"-l | --link-name version_info  Use 'version_info' data in target.exe for the\n"
"                               link name: ProductName, FileDescription, etc.\n"
"-a | --arguments \"arg1 arg2\"   Command arguments if any, use quotes if needed\n"
"-c | --comment   \"a comment\"   Link comment, use quotes if needed (none)\n"
"-d | --directory               Startup directory for shortcut (none)\n"
"-s | --show                    Show: 1/normal, 2/maximized, 7/minimized (1)\n"
"-i | --icon      ex.ico        .ico or .dll containing icon to display\n"
"                               (default is to use icon 0 in target.exe)\n"
"-n | --icon-no   index         Integer index of icon in icon file (0)\n"
"-t | --target-directory dir    Create link in directory 'dir' (.)\n"
"-v | --version                 Show version and copyright and quit\n"
"-? | --help                    Show this help message and quit\n"

"\nExamples:\n"
APPNAME " -a \"%%HOMEDRIVE%%%%HOMEPATH%%\" %%SystemRoot%%\\system32\\cmd.exe \"Command Prompt\"\n"
APPNAME " -a \"--login -i\" -i C:\\cygwin\\cygwin.ico -s7 C:\\cygwin\\bin\\bash.exe \"Bash\"\n"

);
}

int main(int argc, char **argv) {
	opterr = 0;

	while (true) {
		int option_index = 0;

		if (optind < argc && argv[optind] && argv[optind][0] == '/')
			argv[optind][0] = '-';

		int c = getopt_long(argc, argv, short_options, long_options, &option_index);

		if (c == -1)
			break;

        switch (c) {
			case 'a': // --arguments
				opt.arguments = optarg;
				break;
			case 'c': // --comment
				opt.comment = optarg;
				break;
			case 'd': // --directory
				opt.directory = optarg;
				break;
			case 'i': // --icon
				opt.icon = optarg;
				break;
			case 'l': // --link-name
				opt.link_name = optarg;
				break;
			case 'n': // --icon-no
				opt.icon_index = atoi(optarg);
				if (opt.icon_index < 0) {
					usage();
					exit(1);
				}
				break;
			case 's': // --show
				if (_stricmp(optarg, "normal") == 0)
					opt.show = 1;
				else
				if (_stricmp(optarg, "max") == 0)
					opt.show = 2;
				else
				if (_stricmp(optarg, "maximized") == 0)
					opt.show = 2;
				else
				if (_stricmp(optarg, "min") == 0)
					opt.show = 7;
				else
				if (_stricmp(optarg, "minimized") == 0)
					opt.show = 7;
				else {
					opt.show = atoi(optarg);
					if (opt.show <= 1 || opt.show > 8) {
						usage();
						exit(1);
					}
				}
				break;
            case 't': // --target-directory
				opt.target_directory = optarg;
                break;
            case 'v': // --version
				std::cout <<
					APPNAME " " APPVERSION " - " __DATE__ << std::endl <<
					APPCOPYRIGHT << std::endl;
				exit(0);
                break;
			case '?': // --help
				usage();
				exit(0);
			default:
				usage();
				exit(1);
        }
    }

	HRESULT hres = CoInitialize( NULL );

	if (!SUCCEEDED(hres)) {
	    std::cerr << "CoInitialize() failed: " <<
			SystemMessageA(GetLastError()) << std::endl;
		exit(2);
	}

	int rv = 0;

	if (optind >= argc) {
		usage();
		exit(1);
	}

	char *target = argv[optind++];

	if (!target || !*target) {
		usage();
		exit(1);
	}

	char *link_name = optind <= argc ? argv[optind++] : NULL;

	try {
		if (opt.link_name) {
			version v(target);
			static std::string s = v.get_value(opt.link_name);
			link_name = const_cast<char*>(s.c_str());
		}
	} catch(...) {
	}

	if (!link_name || !*link_name) {
		usage();
		exit(1);
	}

	std::string slink;

	slink = link_name;
	std::string ext = slink.substr(slink.length() - 4, 4);
	if (_stricmp(ext.c_str(), ".lnk") != 0) {
		slink += ".lnk";
		link_name = const_cast<char*>(slink.c_str());
	}

	hres = CreateShellLink(
		target,
		link_name,
		opt.directory,
		opt.comment,
		opt.icon,
		opt.icon_index,
		opt.arguments
	);

	if (!SUCCEEDED(hres)) {
		rv = GetLastError();
		std::cerr << "CreateShellLink() failed: " <<
			SystemMessageA(rv) << std::endl;
	}

	CoUninitialize();

//	_getch();

	exit(rv);
	return rv;
}

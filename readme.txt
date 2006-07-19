mklnk 1.2 - Jul 19 2006
Copyright (c) 2005-2006 Ross Smith II (http://smithii.com) All Rights Reserved

------------------------------------------------------------------------------

Usage: mklnk [options] target.exe [link.lnk]

 target.exe   Name of target, use quotes if it contains spaces
 link.lnk     Name of link, use quotes if it contains spaces
              Default is to use the target's name

Options (defaults in parentheses):
-l | --link-name version_info  Use 'version_info' data in target.exe for the
                               link name: ProductName, FileDescription, etc.
-a | --arguments "arg1 arg2"   Command arguments if any, use quotes if needed
-c | --comment   "a comment"   Link comment, use quotes if needed (none)
-d | --directory               Startup directory for shortcut (none)
-s | --show                    Show: 1/normal, 2/maximized, 7/minimized (1)
-i | --icon      ex.ico        .ico or .dll containing icon to display
                               (default is to use icon 0 in target.exe)
-n | --icon-no   index         Integer index of icon in icon file (0)
-t | --target-directory dir    Create link in directory 'dir' (.)
-v | --version                 Show version and copyright and quit
-? | --help                    Show this help message and quit

Examples:

mklnk -a "%HOMEDRIVE%%HOMEPATH%" %SystemRoot%\system32\cmd.exe "Command Prompt"
mklnk -a "--login -i" -i C:\cygwin\cygwin.ico -s7 C:\cygwin\bin\bash.exe "Bash"

------------------------------------------------------------------------------

More Examples:

mklnk -a /e,"%USERPROFILE%\Desktop" c:\windows\explorer.exe "%USERPROFILE%\Application Data\Microsoft\Internet Explorer\Quick Launch\Desktop"
mklnk -a "%USERPROFILE%\My Documents\todo.txt" c:\windows\system32\notepad.exe "%USERPROFILE%\Start Menu\Programs\Startup\To Do List"

rem create a link named "Windows Backup Utility.lnk":

mklnk -l FileDescription c:\windows\system32\ntbackup.exe

------------------------------------------------------------------------------

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

$Id$

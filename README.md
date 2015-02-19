# mklnk 

Make .lnk files

## Usage

````
mklnk [options] target.exe [link.lnk]

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
````

## Examples

````
mklnk -a "%HOMEDRIVE%%HOMEPATH%" %SystemRoot%\system32\cmd.exe "Command Prompt"
mklnk -a "--login -i" -i C:\cygwin\cygwin.ico -s7 C:\cygwin\bin\bash.exe "Bash"

mklnk -a /e,"%USERPROFILE%\Desktop" c:\windows\explorer.exe "%USERPROFILE%\Application Data\Microsoft\Internet Explorer\Quick Launch\Desktop"
mklnk -a "%USERPROFILE%\My Documents\todo.txt" c:\windows\system32\notepad.exe "%USERPROFILE%\Start Menu\Programs\Startup\To Do List"

rem create a link named "Windows Backup Utility.lnk":

mklnk -l FileDescription c:\windows\system32\ntbackup.exe
````

## Contributing

To contribute to this project, please see [CONTRIBUTING.md](CONTRIBUTING.md).

## Bugs

To view existing bugs, or report a new bug, please see the [issues](/issues) page for this project.

## License

This project is [MIT licensed](LICENSE).

## Changelog

Please see [CHANGELOG.md](CHANGELOG.md) for the version history for this project.

## Contact

This project was originally developed by [Ross Smith II](mailto:ross@smithii.com).
Any enhancements and suggestions are welcome.

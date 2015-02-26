# mklnk [![Flattr this][flatter_png]][flatter]

Make .lnk files.

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

````batch
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

To view existing bugs, or report a new bug, please see [issues](../../issues).

## Changelog

To view the version history for this project, please see [CHANGELOG.md](CHANGELOG.md).

## License

This project is [MIT licensed](LICENSE).

## Contact

This project was created and is maintained by [Ross Smith II][] [![endorse][endorse_png]][endorse]

Feedback, suggestions, and enhancements are welcome.

[Ross Smith II]: mailto:ross@smithii.com "ross@smithii.com"
[flatter]: https://flattr.com/submit/auto?user_id=rasa&url=https%3A%2F%2Fgithub.com%2Frasa%2Fmklnk
[flatter_png]: http://button.flattr.com/flattr-badge-large.png "Flattr this"
[endorse]: https://coderwall.com/rasa
[endorse_png]: https://api.coderwall.com/rasa/endorsecount.png "endorse"


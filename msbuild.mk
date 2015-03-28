all:
	MSBuild.exe /nologo mklnk.sln /p:Configuration=Debug
	MSBuild.exe /nologo mklnk.sln /p:Configuration=Release

clean:
	MSBuild.exe /nologo mklnk.sln /p:Configuration=Debug   /t:clean
	MSBuild.exe /nologo mklnk.sln /p:Configuration=Release /t:clean

upgrade:
	devenv mklnk.sln /upgrade
	
.PHONY:	all clean upgrade



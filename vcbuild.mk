all:
	VCBuild.exe /nologo mklnk.vcproj /rebuild

clean:
	VCBuild.exe /nologo mklnk.vcproj /clean
	
upgrade:
	devenv mklnk.sln /upgrade

.PHONY:	all clean upgrade


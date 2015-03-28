# Microsoft Developer Studio Generated NMAKE File, Based on mklnk.dsp
!IF "$(CFG)" == ""
CFG=mklnk - Win32 Debug
!MESSAGE No configuration specified. Defaulting to mklnk - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "mklnk - Win32 Release" && "$(CFG)" != "mklnk - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mklnk.mak" CFG="mklnk - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mklnk - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "mklnk - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mklnk - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\mklnk.exe"


CLEAN :
	-@erase "$(INTDIR)\mklnk.obj"
	-@erase "$(INTDIR)\mklnk.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\mklnk.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\mklnk.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mklnk.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mklnk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=shared.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\mklnk.pdb" /machine:I386 /out:"$(OUTDIR)\mklnk.exe" 
LINK32_OBJS= \
	"$(INTDIR)\mklnk.obj" \
	"$(INTDIR)\mklnk.res"

"$(OUTDIR)\mklnk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mklnk - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\mklnk.exe" "$(OUTDIR)\mklnk.bsc"


CLEAN :
	-@erase "$(INTDIR)\mklnk.obj"
	-@erase "$(INTDIR)\mklnk.res"
	-@erase "$(INTDIR)\mklnk.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\mklnk.bsc"
	-@erase "$(OUTDIR)\mklnk.exe"
	-@erase "$(OUTDIR)\mklnk.ilk"
	-@erase "$(OUTDIR)\mklnk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\mklnk.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mklnk.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mklnk.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\mklnk.sbr"

"$(OUTDIR)\mklnk.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=sharedd.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\mklnk.pdb" /debug /machine:I386 /out:"$(OUTDIR)\mklnk.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\mklnk.obj" \
	"$(INTDIR)\mklnk.res"

"$(OUTDIR)\mklnk.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mklnk.dep")
!INCLUDE "mklnk.dep"
!ELSE 
!MESSAGE Warning: cannot find "mklnk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mklnk - Win32 Release" || "$(CFG)" == "mklnk - Win32 Debug"
SOURCE=.\mklnk.cpp

!IF  "$(CFG)" == "mklnk - Win32 Release"


"$(INTDIR)\mklnk.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "mklnk - Win32 Debug"


"$(INTDIR)\mklnk.obj"	"$(INTDIR)\mklnk.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\mklnk.rc

"$(INTDIR)\mklnk.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 


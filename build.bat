@echo off

set jarfile="loader-Glide-v%date:~6,4%%date:~3,2%%date:~0,2%.jar"
set gradle_bat="%~dp0\..\..\SDKs\utilities\gradle-win-v1.8\bin\gradle.bat"
set bundle="build\bundles\release"
set workspace="%~dp0\..\android-iLiga-Base"

cd library

del build\bundles\release\*.jar
call %gradle_bat% assembleRelease

cd %bundle%
ren classes.jar %jarfile%

del %workspace%\libs\loader-Glide-v*.jar

copy %jarfile% %workspace%\libs

cd %workspace%\libs
ren loader-Glide-v*.jar.properties %jarfile%.properties

cd %~dp0

pause
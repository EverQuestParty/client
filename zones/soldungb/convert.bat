@echo off
set last=blender
set zone=soldungb
blender --background %zone%.blend --python C:\src\eqgzi\out\convert.py || goto :error

set last=eqgzi
eqgzi import %zone% || goto :error

set last=copy
copy out\* c:\src\demoncia\client\rof\ || goto :error

set last=azone
cd out 
azone %zone% || goto :error 
cd ..
del out\azone.log
move out\%zone%.map C:\src\server\build\bin\Debug\maps\base

set last=awater
cd out 
awater %zone% || goto :error
cd ..
del out\awater.log
move out\%zone%.wtr C:\src\server\build\bin\Debug\maps\water\

goto :EOF

:error
echo failed during %last% with signal #%errorlevel%
exit /b %errorlevel%
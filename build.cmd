@ECHO OFF
cd %~dp0

IF "%1" == "" (

	@powershell -NoProfile -ExecutionPolicy unrestricted -command "&{ .\scripts\build.ps1 -buildParams /p:Configuration=Release; exit $LastExitCode; }"
  
) else (

	@powershell -NoProfile -ExecutionPolicy unrestricted -command "&{ .\scripts\build.ps1 -buildParams /p:Configuration=%1%; exit $LastExitCode; }"
)
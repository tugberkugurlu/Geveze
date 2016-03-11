 $ErrorActionPreference = "Stop"

New-Item "c:\dlmas" -ItemType Directory | Out-Null
Invoke-WebRequest "https://download.red-gate.com/DLMAutomationSuite.exe" -OutFile "c:\dlmas\DLMAutomationSuite.exe"
& start /wait C:\dlmas\DLMAutomationSuite.exe /install /quiet /norestart
Start-Process -FilePath C:\dlmas\DLMAutomationSuite.exe -ArgumentList @("/install", "/quiet", "/norestart") -NoNewWindow -Wait
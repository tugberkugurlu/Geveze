New-Item "c:\dlmas" -ItemType Directory | Out-Null
Invoke-WebRequest "https://download.red-gate.com/DLMAutomationSuite.exe" -OutFile "c:\dlmas\DLMAutomationSuite.exe"
& start /wait DLMAutomationSuite.exe /install /quiet /norestart
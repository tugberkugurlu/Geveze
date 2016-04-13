param(
    $buildFile   = (join-path (Split-Path -parent $MyInvocation.MyCommand.Definition) "build.msbuild"),
    $buildParams = "/p:Configuration=Release",
    $buildTarget = "/t:Default"
)

$ErrorActionPreference = "Stop"

$DLMAS_HOME = [System.Environment]::GetEnvironmentVariable("DLMAS_HOME", "Machine")
$dbPath = (join-path (join-path (Split-Path -parent $MyInvocation.MyCommand.Definition) "..") "\db")
$artifactsPath = (join-path (join-path (Split-Path -parent $MyInvocation.MyCommand.Definition) "..") "\artifacts")

## TeamCity and AppVeyor stuff. Get this as a parameter
$buildNumber = $env:BUILD_NUMBER
if($buildNumber -eq $null) 
{
    $buildNumber = $env:APPVEYOR_BUILD_VERSION
    if($buildNumber -eq $null) 
    {
        $buildNumber = "0.0.0-0"
    }
}

& "$(get-content env:windir)\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" $buildFile $buildParams $buildTarget /p:VisualStudioVersion=12.0
& "$(Join-Path $DLMAS_HOME 'SQLCI\sqlCI.exe')" Build --scriptsFolder="$dbPath" --outputFolder="$artifactsPath" --packageId="Geveze" --packageVersion="$buildNumber"

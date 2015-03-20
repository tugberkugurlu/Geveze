param(
    $buildFile   = (join-path (Split-Path -parent $MyInvocation.MyCommand.Definition) "build.msbuild"),
    $buildParams = "/p:Configuration=Release",
    $buildTarget = "/t:Default"
)

Write-Host "dir folders"
dir "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
dir "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\sqlci\"

$dbPath = (join-path (join-path (Split-Path -parent $MyInvocation.MyCommand.Definition) "..") "\db")
$artifactsPath = (join-path (join-path (Split-Path -parent $MyInvocation.MyCommand.Definition) "..") "\artifacts")

& "$(get-content env:windir)\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" $buildFile $buildParams $buildTarget /p:VisualStudioVersion=12.0
& "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\sqlci\sqlCI.exe" Build --scriptsFolder="$dbPath" --outputFolder="$artifactsPath" --packageId="Geveze" --packageVersion="$env:APPVEYOR_BUILD_VERSION"

dir "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\sqlci\"

dir $artifactsPath
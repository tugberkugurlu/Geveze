function Download-File($url, $targetFile) { 
    "Downloading $url" 
    $uri = New-Object "System.Uri" "$url" 
    $request = [System.Net.HttpWebRequest]::Create($uri) 
    $request.set_Timeout(15000) #15 second timeout 
    $response = $request.GetResponse() 
    $totalLength = [System.Math]::Floor($response.get_ContentLength()/1024) 
    $responseStream = $response.GetResponseStream() 
    $targetStream = New-Object -TypeName System.IO.FileStream -ArgumentList $targetFile, Create 
    $buffer = new-object byte[] 10KB 
    $count = $responseStream.Read($buffer,0,$buffer.length) 
    $downloadedBytes = $count 
    while ($count -gt 0) 
    { 
        [System.Console]::CursorLeft = 0 
        [System.Console]::Write("Downloaded {0}K of {1}K", [System.Math]::Floor($downloadedBytes/1024), $totalLength) 
        $targetStream.Write($buffer, 0, $count) 
        $count = $responseStream.Read($buffer,0,$buffer.length) 
        $downloadedBytes = $downloadedBytes + $count 
    } 
    "`nFinished Download" 
    $targetStream.Flush()
    $targetStream.Close() 
    $targetStream.Dispose() 
    $responseStream.Dispose() 
}

function Get-BaseName { 
    $fileLabel = "sqlci"
    return "$($fileLabel)-$((get-date).ToString("yyyyMMddHHmmss"))"
}

$zipToDownloadUrl = "https://tugberkredgate.blob.core.windows.net/cmd/sqlCI.zip"
$zipFileName = "$(Get-BaseName).zip"
$zipFileFullPath = "$env:TEMP\$zipFileName"
$fullPathToUnzip = "$env:TEMP\sqlci"
New-Item -Path $fullPathToUnzip -ItemType Directory | Out-Null
Download-File $zipToDownloadUrl $zipFileFullPath

Write-Host $zipFileFullPath

 # Unzip the downloaded zip file
$shellApp = new-object -com shell.application
$zipFile = $shellApp.namespace($zipFileFullPath)
$destinationToUnzip = $shellApp.namespace($fullPathToUnzip)
$destinationToUnzip.Copyhere($zipFile.items())
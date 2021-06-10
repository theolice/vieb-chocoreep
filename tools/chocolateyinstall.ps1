$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Jelmerro/Vieb/releases/download/5.1.0/Vieb.Setup.5.1.0.exe'
$url64      = 'https://github.com/Jelmerro/Vieb/releases/download/5.1.0/Vieb.Setup.5.1.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'vieb*'

  checksum      = '7c16d63ef53560a232a1c6176f9cdd944de85d88060db0914c83150eb5555824'
  checksumType  = 'sha256'
  checksum64    = '7c16d63ef53560a232a1c6176f9cdd944de85d88060db0914c83150eb5555824'
  checksumType64= 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

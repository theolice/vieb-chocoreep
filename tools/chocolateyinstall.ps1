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

  checksum      = 'DED2753521EE65BC05CBE30385AEB795009AF1B4C8B54364DD2DCFC1F7E17DE5'
  checksumType  = 'sha256'
  checksum64    = 'DED2753521EE65BC05CBE30385AEB795009AF1B4C8B54364DD2DCFC1F7E17DE5'
  checksumType64= 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

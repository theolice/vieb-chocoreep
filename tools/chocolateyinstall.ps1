$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Jelmerro/Vieb/releases/download/5.2.0/Vieb.Setup.5.2.0.exe'
$url64      = 'https://github.com/Jelmerro/Vieb/releases/download/5.2.0/Vieb.Setup.5.2.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'vieb*'

  checksum      = '6EC33AD36F5E0220C9541E3BEEE87ED3F89DB653B6983DED8B7E1E2A911CC4F0'
  checksumType  = 'sha256'
  checksum64    = '6EC33AD36F5E0220C9541E3BEEE87ED3F89DB653B6983DED8B7E1E2A911CC4F0'
  checksumType64= 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

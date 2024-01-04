#!/bin/bash
# download latest setup
setup_url=$(curl https://api.github.com/repos/Jelmerro/Vieb/releases/latest | grep "browser_download_url" | grep "Setup" | grep ".exe")
setup_url=$(echo "$setup_url" | cut -d ":" -f "2,3" | tr -d '"' | tr -d ',' | tr -d ' ')
echo "$setup_url"
wget "$setup_url" -O vieb.exe
# calculate checksum and delete
checksum=$(sha256sum vieb.exe | cut -d " " -f "1" | tr '[:lower:]' '[:upper:]')
echo "$checksum"
rm vieb.exe
# find semantic version number
version=$(curl https://api.github.com/repos/Jelmerro/Vieb/releases/latest | grep "tag_name")
echo "$version"
version=$(echo "$version" | cut -d ":" -f "2,3" | tr -d '"' | tr -d ',' | tr -d ' ')
echo "$version"
# replace download url in install script
sed -i "s,https://github.com.*,${setup_url}',g" ./tools/chocolateyinstall.ps1
# replace checksum in install script
sed -i "s,checksum      = '.*,checksum      = '$checksum',g" ./tools/chocolateyinstall.ps1
# replace version in nuspec file
sed -i "s,<version>.*</version>,<version>$version</version>,g" ./vieb.nuspec
# commit the release, but don't push yet
git commit -am "v$version"

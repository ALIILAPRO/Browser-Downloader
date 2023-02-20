#!/bin/bash

# Determine the operating system
os=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    os="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    os="mac"
elif [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "cygwin"* ]]; then
    os="windows"
else
    echo "Unsupported operating system"
    exit 1
fi

# Set the download URLs and file names
if [[ "$os" == "linux" ]]; then
    firefox_url="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
    firefox_file="firefox.tar.bz2"
    chrome_url="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    chrome_file="chrome.deb"
elif [[ "$os" == "mac" ]]; then
    firefox_url="https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US"
    firefox_file="firefox.dmg"
    chrome_url="https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
    chrome_file="chrome.dmg"
elif [[ "$os" == "windows" ]]; then
    firefox_url="https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
    firefox_file="firefox.exe"
    chrome_url="https://dl.google.com/chrome/install/standalone/GoogleChromeStandaloneEnterprise64.msi"
    chrome_file="chrome.msi"
fi

# Download Firefox
echo "Downloading Firefox..."
curl -L -o "$firefox_file" "$firefox_url"

# Download Chrome
echo "Downloading Chrome..."
curl -L -o "$chrome_file" "$chrome_url"

echo "Downloads complete"
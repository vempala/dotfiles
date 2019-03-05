#!/bin/sh

if ! which -s brew 2>&1 ; then
    echo "brew not installed"
fi

brew update
brew upgrade

# EXTRA: Create own taps/casks for: 
#  (see https://github.com/Homebrew/brew/blob/master/docs/How-to-Create-and-Maintain-a-Tap.md)
#  - simple screen shade, totalspaces2, sophos antivirus, 

# EXTRA: Install via the App Store
#  - haskell-for-mac \ # $24

brew cask install \
    atom \
    avg-antivirus \
    box-sync \
    colloquy \
    dropbox \
    # haskell-for-mac \
    kindle \
    libreoffice \
    mpv \
    music-manager \
    the-unarchiver \
    vlc

# brew install \   #TODO
#     thing1 \
#     thing2

brew cleanup

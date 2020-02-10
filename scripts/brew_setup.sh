#!/bin/sh

if ! which -s brew 2>&1 ; then
    echo "brew not installed"
fi

brew update
brew upgrade

# EXTRA: Install via the App Store
#  - haskell-for-mac \ # $24
    # bettertouchtool \
    # docker \
    # firefox \
    # flux \
    # google-chrome \
    # haskell-for-mac \
    # hammerspoon \
    # virtualbox 
    # optimal-layout \ # get this from the app store. Homebrew version can't be granted accessibility privilege in "Security and Privacy"

brew cask install \
    adobe-acrobat-reader \
    alfred \
    iterm2 \
    java \
    karabiner-elements \
    moom \
    notion \
    skype \
    spectacle \
    vagrant

# checkstyle \
    # gnome-common \
    # maven \
    # node \
    # grip \ #readme driven development
brew install \
    bash-completion \
    boost \
    clang-format \
    cmake \
    coreutils \
    cppcheck \
    ctags \
    doxygen \
    gcc \
    git \
    grip \
    htop \
    hub \
    llvm \
    neovim \
    python \
    python3 \
    shellcheck \
    tmux \
    tree \
    vim \
    watch \
    zsh

brew cleanup

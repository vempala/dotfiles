#!/bin/sh

if ! which -s brew 2>&1 ; then
    echo "brew not installed"
fi

brew update
brew upgrade

# EXTRA: Install via the App Store
#  - haskell-for-mac \ # $24

brew cask install \
    adobe-acrobat-reader \
    alfred \
    bettertouchtool \
    docker \
    firefox \
    flux \
    google-chrome \
    # haskell-for-mac \
    hammerspoon \
    iterm2 \
    java \
    karabiner-elements \
    moom \
    notion \
    optimal-layout \
    skype \
    spectacle \
    vagrant \
    virtualbox

brew install \
    bash-completion \
    boost \
    checkstyle \
    clang-format \
    cmake \
    coreutils \
    cppcheck \
    ctags \
    doxygen \
    gcc \
    git \
    gnome-common \
    grip \
    htop \
    hub \
    llvm \
    maven \
    neovim \
    node \
    python \
    python3 \
    shellcheck \
    tmux \
    tree \
    vim \
    watch \
    zsh

brew cleanup

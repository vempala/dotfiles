#!/bin/sh

if ! which -s brew 2>&1 ; then
    echo "brew not installed"
fi

brew update
brew upgrade

echo "Install Python 3.6 (if needed) from https://www.python.org/downloads/mac-osx/"

brew tap homebrew/cask-versions

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
    alfred3 \
    iterm2 \
    java \
    karabiner-elements \
    moom \
    notion \
    skype \
    spectacle \
    vagrant \
    bettertouchtool \
    ubar \
    hyperswitch \
    dozer \
    flux \
    cheatsheet \
    witch \
    scroll-reverser \
    cyberduck \
    dozer

# checkstyle \
    # gnome-common \
    # maven \
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
    node \
    python \
    python3 \
    flake8 \
    shellcheck \
    tmux \
    tree \
    vim \
    watch \
    zsh \
    go

brew cleanup


# 19:37:17 dotfiles 5380 ✓ $ brew list
# asciidoc		displayplacer		grip			libproxy		msgpack			python@3.8		unibilium
# autoconf		docbook			htop			libtermkey		ncurses			readline		utf8proc
# automake		doxygen			hub			libtool			neovim			ruby			vim
# bash-completion		flake8			icu4c			libuv			node			shellcheck		watch
# boost			gcc			ipython			libvterm		openssl@1.1		source-highlight	xz
# clang-format		gdbm			isl			libyaml			pandoc			sqlite			zeromq
# cmake			gettext			jupyterlab		llvm			pcre			swig			zsh
# coreutils		git			libevent		lua			pcre2			tinyproxy-libproxy
# cppcheck		gmp			libffi			luajit			perl			tmux
# ctags			go			libmpc			mpfr			python			tree

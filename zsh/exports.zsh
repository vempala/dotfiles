#!/usr/bin/env zsh

export GTEST_COLOR=yes

# Command auto-correction.
export ENABLE_CORRECTION="true"

export LIBRARY_PATH="/opt/X11/lib:$LIBRARY_PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# fix locale
# zsh doesn't seem to know that my prompt is UTF-8 -- See https://unix.stackexchange.com/questions/90772/first-characters-of-the-command-repeated-in-the-display-when-completing/302418#302418
export LC_CTYPE=en_US.UTF-8
# fix the "sort order" of spaces, underscores, lower/upper case letters, numbers -- https://stackoverflow.com/questions/1184268/unix-sort-treatment-of-underscore-character
export LC_COLLATE=C

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline]]]]]]]'

export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false
if [ "$TERM" != "screen-256color" ]; then
    export TERM=xterm-256color
fi

if [ "$(uname)" = "Darwin" ]; then
    export MACOS="true"
    export EDITOR=vim
fi

# Reduce delay to 0.1 seconds for switching to normal mode with ESC
export KEYTIMEOUT=20

#berg
if [ -d /opt/bb/bin ]; then
    PATH=/opt/bb/bin:$PATH
fi

# kartik
# uses tinyproxy. Via https://bbgithub.dev.bloomberg.com/drodrig1/blpapi-bbvpn/blob/master/tinyproxy.md
export http_proxy=http://localhost:8888
export https_proxy=http://localhost:8888
export HTTP_PROXY=http://localhost:8888
export HTTPS_PROXY=http://localhost:8888

# kartik
no_proxy=artprod.dev.bloomberg.com,$no_proxy

# FYI - from Andy T's dotfiles
NOPROXY_BLOOMBERG="localhost,127.0.0.1,repo.dev.bloomberg.com,artifactory.bdns.bloomberg.com,artprod.dev.bloomberg.com,bbgithub.dev.bloomberg.com,blp-dpkg.dev.bloomberg.com,kubaas-api.dev.bloomberg.com"


# kartik
# "more local" paths are before "more standard" paths
# berg

PATH=~/.local/bin:$PATH
PATH=~/bin:$PATH
PATH=~/bin_local:$PATH
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/bb/bin


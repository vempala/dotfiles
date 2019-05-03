#!/usr/bin/env zsh

if [ "$(uname)" = "Darwin" ]; then
    # if no gls, brew install coreutils
    # alias ls='gls --color=auto'
    alias ls='gls --color=auto --group-directories-first -X -rt'
else
    # alias ls='ls --color=auto'
    alias ls='ls --color=auto --group-directories-first -X -rt'
fi

alias cdr='cd $(git rev-parse --show-toplevel)'
alias fn='find . -name'
alias g='git'
alias gg='git grep'
alias ggi='git grep -i'
alias grep='grep --color=auto'
alias l='ls -Fhlp'
alias la='l -a'
alias less='less -N'
alias ll='ls -lrtah'
alias lower="tr '[:upper:]' '[:lower:]'"
alias m='make -j'
alias mt='make -j test'
alias p='ps aux | grep '
alias tmux='tmux -2u'
alias topcpu='/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
alias upper="tr '[:lower:]' '[:upper:]'"
alias wfc='curl "wttr.in/nyc?m"'
alias ch='cht.sh'
alias cht='cht.sh'
alias cl='clear'
alias tree='tree --ignore-case -I "cmake.bld|RefRoot|.git"'
alias treeall='tree -a --ignore-case -I "cmake.bld|RefRoot|.git"'
alias treedisk='tree --du -a --ignore-case -I "cmake.bld|RefRoot|.git"'
alias treedirs='tree -d --ignore-case -I "cmake.bld|RefRoot|.git"'
alias treemodified='tree -a --ignore-case -I "cmake.bld|RefRoot|.git"'

# semi-transient aliass
alias py3='python3.6'

[ -f ~/.zsh_local/zshrc_local_aliases.zsh ] && source ~/.zsh_local/zshrc_local_aliases.zsh


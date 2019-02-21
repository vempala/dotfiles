#!/usr/bin/env zsh

## ============================================================================
##                                 Settings
## ============================================================================
# Vim mode
bindkey -v

bindkey -M "vicmd" 'k' history-substring-search-up
bindkey -M "vicmd" 'j' history-substring-search-down

# Run `bindkey -l` to see a list of modes, and `bindkey -M foo` to see a list of commands active in mode foo
# Move to vim escape mode
bindkey -M "viins" jj vi-cmd-mode
# bindkey -M "viins" kk vi-cmd-mode
bindkey -M "viins" jk vi-cmd-mode
# bindkey -M "viins" kj vi-cmd-mode

# Unmap ctrl-s as "stop flow"
stty stop undef

#  ============================================================================
#                            Configure Plugins
#  ============================================================================
# zsh-autosuggestions
# # Bind <CTRL><SPC> to accept and execute
bindkey '^ ' autosuggest-accept

## ============================================================================
##                                  Prompt
## ============================================================================
git_prompt_info_mine() {
    git_prompt_text="$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)" || ""
    if [[ -n $git_prompt_text ]]; then
        #echo "< $git_prompt_text>" #kartik
        echo "<$git_prompt_text>"
    else
        echo ""
    fi
}

# kartikhere
# export PROMPT='%{$fg[green]%}%n@%m %{$fg[cyan]%}%c%{$fg[yellow]%}$(git_prompt_info_mine)%{$reset_color%} $ '
#export PROMPT='%{$fg[green]%}%n@%m %{$fg[cyan]%}%d
#%{$fg[yellow]%}$(git_prompt_info_mine)%{$reset_color%} $ '
#export PROMPT='%{$fg[green]%}%n@%m %{$fg[cyan]%}%d'$'\n''%{$fg[yellow]%}$(git_prompt_info_mine)%{$reset_color%} $ '


# via https://stackoverflow.com/questions/14049870/zsh-rprompt-weird-spacing/14059262#14059262
export PROMPT='%F{green}%n@%m %F{yellow}$(git_prompt_info_mine) %F{cyan}%d
%F{244}%* %U%F{cyan}%c%u %F{magenta}%h %(?.%F{green}✓.%F{red}✗)%b %f$ '

export ZSH_THEME_GIT_PROMPT_PREFIX=""
export ZSH_THEME_GIT_PROMPT_SUFFIX=""

#  ============================================================================
#                               FZF Config
#  ============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# kartikhere
setopt inc_append_history_time # 'history -D | tail' -- will contain the 'time' needed to run the command too

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Keymaps
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Movement
# db -- to delete the word behind you
# dw -- to delete the word in front of you
# vi-caps-lock-panic :)
bindkey -M "vicmd" "L" vi-end-of-line
bindkey -M "vicmd" "H" vi-beginning-of-line

# To complete an autosuggestion by zsh -- <ctrl><space> :)

# fzf stuff

# INTERNAL UTILITY FUNCTIONS {{{1

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() {
  return $( eval $* >/dev/null 2>&1 )
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

# Returns whether out terminal supports color.
_color() {
  return $( [ -z "$INSIDE_EMACS" -a -z "$VIMRUNTIME" ] )
}

# PATH MODIFICATIONS {{{1

# Functions which modify the path given a directory, but only if the directory
# exists and is not already in the path. (Super useful in ~/.zshlocal)

_prepend_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
  path=($1 $path);
  fi
}

_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
      path=($1 $path);
  fi
}

_force_prepend_to_path() {
  path=($1 ${(@)path:#$1})
}

# fzf via local installation
if [ -e ~/.fzf ]; then
    _append_to_path ~/.fzf/bin
    source ~/.fzf/shell/key-bindings.zsh
    source ~/.fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
    export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='
    --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
    --color info:108,prompt:109,spinner:108,pointer:168,marker:168
    '
fi




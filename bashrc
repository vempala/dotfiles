#!/bin/bash
## don't read bashrc if session is not interactive
[ -z "$PS1" ] && return
echo "Loading bashrc"

if [ -f ~/.bashrc_local/bashrc_local_before.sh ]; then
    source ~/.bashrc_local/bashrc_local_before.sh
fi

source ~/.bash/functions.sh
source ~/.bash/settings.sh
source ~/.bash/aliases.sh
source ~/.bash/exports.sh

if [ -f ~/.bashrc_local/bashrc_local_after.sh ]; then
    source ~/.bashrc_local/bashrc_local_after.sh
fi

pathDeduplicate

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kartik/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kartik/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kartik/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kartik/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


echo "Loading zshrc"
if [ -f ~/.zsh_local/zshrc_local_before.zsh ]; then
    source ~/.zsh_local/zshrc_local_before.zsh
fi

fpath+=(~/.zsh/completions $fpath)

## ZSH SOURCING SETTINGS
# disable escaping of parentheses while pasting to console
DISABLE_MAGIC_FUNCTIONS=true

source ~/.zsh/functions.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/settings.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/exports.zsh

if [ -f ~/.zsh_local/zshrc_local_after.zsh ]; then
    source ~/.zsh_local/zshrc_local_after.zsh
fi

pathDeduplicate

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kartik/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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


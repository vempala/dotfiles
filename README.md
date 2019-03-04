# dotfiles [![Build Status](https://travis-ci.org/yarko3/dotfiles.svg?branch=master)](https://travis-ci.org/yarko3/dotfiles)
My dotfiles for vim, tmux, etc.

### Installation
```
cd ~/dotfiles
git pull
./install
```

### Support C-like languages in YouCompleteMe
cd dotfiles/vim/pluggy/YouCompleteMe
# To get support for ALL languages (in addition to the default languages)
```
./install.py --all
```
# To get support for C-like languages (in addition to the default languages)
```
/install.py --clang-completer
```
-OR- Follow the instructions at
- https://valloric.github.io/YouCompleteMe/#installation
- If the above doesn't work -> https://valloric.github.io/YouCompleteMe/#full-installation-guide
- If it still doesn't work, maybe try this -> https://vi.stackexchange.com/questions/7470/how-to-install-youcompleteme-with-clang-completer-offline/7471#7471

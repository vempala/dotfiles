#!/bin/bash
# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# update plugins
~/.tmux/plugins/tpm/bin/update_plugins all
# killing the server is not required
# tmux kill-server

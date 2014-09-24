## setup general dotfile paths
. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/config
. ~/bin/dotfiles/bash/aliases

## setup phantomjs loc
export PATH=$HOME/SDKs/phantomjs-1.9.7/bin:$PATH

## setup nvm for node and set version
. $HOME/nvm/nvm.sh
nvm use 0.11.12

. ~/bin/dotfiles/.bashrc
export PATH=$HOME/bin/dotfiles/bash/:$PATH
export PATH=$HOME/python/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/smlnj/bin:$PATH
export PATH=$HOME/SDKs/sbt/bin:$PATH
export PATH=/usr/lib/scala-2.10.3/bin:$PATH
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=$HOME/libs/mongodb/bin:$PATH
export PATH=/ColgateDevEnv/ant-1.6.2/bin:$PATH

export RFDEV=/RedFuse_FrontEndDev
export TEMP_DIR=~/tmp
export GEM_HOME=~/gems

export NODE_PATH=/Users/jwehrman/nvm/v0.10.0/bin/node:/Users/jwehrman/nvm/v0.10.0/bin/lib/node_modules
export PATH=$NODE_PATH:$PATH

test -r /sw/bin/init.sh && . /sw/bin/init.sh
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

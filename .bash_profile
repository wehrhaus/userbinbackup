if [ -f ~/.bashrc ];
then
	source ~/.bashrc
fi

source ~/bin/dotfiles/bash/tab.bash
export PGHOST=localhost
source ~/.profile

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

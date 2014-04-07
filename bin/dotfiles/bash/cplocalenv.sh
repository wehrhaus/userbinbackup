#!/bin/bash

echo "updating /svn16/libs16"
svn update /svn16/libs16

echo "Choose an Application"
read userApplication

echo "Updating /svn16/"$userApplication"/trunk"
svn update /svn16/$userApplication -N
cd $userApplication
svn update /svn16/$userApplication/trunk

echo "Reverting /svn16/"$userApplication"/tags"
svn revert /svn16/$userApplication/tags

echo "Updating /svn16/"$userApplication"/tags -N"
svn update /svn16/$userApplication/tags -N

echo "executing setenv.sh"
## run setenv.sh in seperate terminal
sudo ~/bin/dotfiles/bash/term.sh -x /ColgateDevEnv ./setenv.sh

echo "executing apache.sh"
## run apache.sh in seperate terminal
sudo ~/bin/dotfiles/bash/term.sh -x /ColgateDevEnv ./apache_restart.sh

echo "executing colgate.sh"
## run colgate.sh in seperate terminal
sudo ~/bin/dotfiles/bash/term.sh -x /ColgateDevEnv ./colgate.sh

echo "Moving to /svn16/"$userApplication"/trunk"
cd /svn16/$userApplication/trunk

#!/bin/bash

echo "update hosts? [y OR n]"
read updateHosts

if [[ $updateHosts = 'y' ]]; then
    oh ## alias to open hosts file
fi

## CProfCommon
echo "Updating CProfCommon"
svn update /svn16/CProfCommon/trunk
echo "Ant War? [y OR n]"
read CProfCommonWar

if [[ $CProfCommonWar = 'y' ]]; then
    cd /svn16/CProfCommon/trunk
    ant war
fi

## CProfDetail
echo "Updating CProfDetail"
svn update /svn16/CProfDetail/trunk
echo "Ant War? [y OR n]"
read CProfDetailWar
if [[ $CProfDetailWar = 'y' ]]; then
    cd /svn16/CProfDetail/trunk
    ant war
fi

## CProfLearning
echo "Updating CProfLearning"
svn update /svn16/CProfLearning/trunk
echo "Ant War? [y OR n]"
read CProfLearningWar
if [[ $CProfLearning = 'y' ]]; then
    cd /svn16/CProfLearning/trunk
    ant war
fi

## echo CProfProfile
echo "Updating CProfProfile"
svn update /svn16/CProfProfile/trunk
echo "Ant War? [y OR n]"
read CProfProfileWar
if [[ $CProfProfileWar = 'y' ]]; then
    cd /svn16/CProfProfile/trunk
    ant war
fi

echo "Choose an Application"
read userApplication

echo "Updating /svn16/"$userApplication"/trunk"
svn update /svn16/$userApplication/trunk

echo "Reverting /svn16/"$userApplication"/tags"
svn revert /svn16/$userApplication/tags

echo "Updating /svn16/"$userApplication"/tags -N"
svn update /svn16/$userApplication/tags -N

echo "executing setenv.sh"
## run setenv.sh in seperate terminal
sudo ~/bin/dotfiles/bash/term.sh -x /ColgateDevEnv ./setenv.sh

## Finish up with apache restart and copcas start
cd /ColgateDevEnv/
echo "Restarting Apache"
./apache_restart.sh
echo "Starting copcas"
./copcas.sh

echo "Moving to /svn16/"$userApplication"/trunk"
cd /svn16/$userApplication/trunk
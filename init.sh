#!/bin/bash

#Install xcode + sublime text 2 first!

#Get homebrew running
ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"

#Git config
git config --global user.name jeff
git config --global user.email leterip@gmail.com

#Sublime text link
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

#Sublime text packages
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
cp subl-support/Base\ File.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/


#Bash profile
ln -s `pwd`/.bash_profile ~/.bash_profile
source ~/.bash_profile

#Golang
sudo pip install mercurial
hg clone -u go1.0.2 https://code.google.com/p/go /usr/local
cd /usr/local/go/src
./all.bash

#bup
cd ~/Code
git clone git://github.com/apenwarr/bup
cd bup
make
make test
sudo make install

#Make key holding not stupid
defaults write -g ApplePressAndHoldEnabled -bool NO

#install mysqld
brew install mysql
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/mysql/5.5.14/com.mysql.mysqld.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist

/usr/local/Cellar/mysql/5.5.14/bin/mysql_secure_installation


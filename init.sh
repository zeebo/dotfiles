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
cp subl-support/Golang.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/
cp subl-support/php.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/

#textual styles
mkdir -p ~/Library/Application\ Support/Textual/Styles
cp -r textual-support/experimental\ 2 ~/Library/Application\ Support/Textual/Styles/

#Bash profile
ln -s `pwd`/.bash_profile ~/.bash_profile
source ~/.bash_profile

#Coding Environment
mkdir -p ~/Code/envs

#Virtualenv wrapper
sudo easy_install pip
pip install virtualenv virtualenvwrapper

#Hooks
ln -sF `pwd`/postactivate ~/Code/envs/
ln -sF `pwd`/postmkvirtualenv ~/Code/envs/

#Golang
hg clone -u release https://go.googlecode.com/hg/ ~/Code/go
cd ~/Code/go/src
./all.bash

#Godag
hg clone https://godag.googlecode.com/hg/ ~/Code/golang/godag
cd ~/Code/golang/godag
hg update release
./build.sh install


#bup
cd ~/Code
git clone git://github.com/apenwarr/bup
cd bup
make
make test

#Make key holding not stupid
defaults write -g ApplePressAndHoldEnabled -bool NO

#Set up router system.
echo "**************** Be sure to enable apache"
mkvirtualenv router
pip install paste django werkzeug wsgiproxy
git clone git://github.com/zeebo/router
sudo router/setup.sh
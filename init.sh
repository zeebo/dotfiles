#!/bin/bash

#Get homebrew running
ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"

#Git config
git config --global user.name jeff
git config --global user.email leterip@gmail.com

#Sublime text link
ln -s "/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

#Bash profile
ln -s .bash_profile ~/.bash_profile
source ~/.bash_profile

#Coding Environment
mkdir -p ~/Code/envs

#Virtualenv wrapper
sudo easy_install pip
pip install virtualenv virtualenvwrapper

#Hooks
ln -s postactivate ~/Code/envs/
ln -s postmkvirtualenv ~/Code/envs/

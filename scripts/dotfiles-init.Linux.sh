#!/usr/bin/env bash


#install 
# fzf
# starship
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
sudo apt-get update 
sudo apt-get install -qqy git
git clone --bare --git-dir $HOME/.dotfiles.git  https://github.com/${GIT_REPO}.git 
dotfiles checkout


apt-get install curl wget fzf direnv


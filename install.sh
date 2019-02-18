#!/bin/sh

sudo passwd $USER
git clone --branch build-server https://github.com/stasbar/dotfiles-fish.git ~/dotfiles/fish
~/dotfiles/fish/setup.sh

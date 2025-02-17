#!/bin/bash

# Add oh-my-zsh as a submodule if it's not there yet
if [ ! -d "oh-my-zsh" ]; then
  git submodule add https://github.com/ohmyzsh/ohmyzsh home/oh-my-zsh
fi

# Add devcontainer as submudle if it's not there yet
if [ ! -d "devcontainer" ]; then
  git submodule add https://github.com/agent-hah/dotfiles.git/.devcontainer home/.devcontainer
  fi

# Get the latest oh-my-zsh
git submodule init
git submodule update --recursive --remote

root=$(pwd)
for file in $(ls home)
do
    source="$root/home/$file"
    target="$HOME/.$file"

    echo "Copying $source to $target"
    cp -r $source $target
done

# Copy devcontainer.jsonc to the appropriate location
devcontainer_source="$root/home/devcontainer/devcontainer.jsonc"
devcontainer_target="$HOME/.devcontainer.jsonc"

if [ -f "$devcontainer_source" ]; then
    echo "Copying $devcontainer_source to $devcontainer_target"
    cp "$devcontainer_source" "$devcontainer_target"
fi
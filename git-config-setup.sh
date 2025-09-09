#!/bin/bash

git config --global user.name $username
git config --global user.email $email
git config --global init.defaultBranch main
git config --global color.ui auto

read -p "set vscode as your default commit editor? y/n " update_commit_editor

if [[ $update_commit_editor = "y" ]]; then
  git config --global core.editor "code --wait"
fi

echo git configuration completed
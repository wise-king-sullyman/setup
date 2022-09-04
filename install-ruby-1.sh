#!/bin/bash

if [[ $os_flavor = "ubuntu" ]]; then
  echo "Installing ruby deps for ubuntu"
  sudo apt update
  sudo apt upgrade
  sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
elif [[ $os_flavor = "fedora" ]]; then
  echo "Installing ruby deps for fedora"
  sudo dnf update
  sudo dnf upgrade
  sudo dnf install git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
fi

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo "rbenv installed, close terminal"
exit
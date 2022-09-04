#!/bin/bash

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

rbenv -v
read -p "rbenv is installed if a rbenv version is returned above. Press enter to install Ruby"

rbenv install $ruby_target_version --verbose

rbenv global 3.1.2
ruby -v

read -p "ruby is installed if a ruby version is returned above. Press enter to continue."
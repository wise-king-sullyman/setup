#!/bin/bash

source get-os-flavor.sh
os_flavor=$(get_os)

source vars.sh

# get user desired config

read -p "configure git? y/n " configure_git

read -p "setup SSH key? y/n " setup_ssh_key

read -p "install node? (also installs NVM) y/n " install_node

read -p "install rails? (also installs ruby, env, and yarn) y/n " install_rails

if [[ $install_rails != "y" ]]; then
  read -p "install ruby? (also installs rbenv) y/n " install_ruby
fi

if [[ $install_ruby != "y" ]] && [[ $install_rails != "y" ]]; then
  read -p "install rbenv? y/n " install_rbenv
fi

if [[ $install_rails != "y" ]]; then
  read -p "install yarn? y/n " install_yarn
fi

# perform installs

if [[ $configure_git = "y" ]]; then
    source git-config-setup.sh
fi

if [[ $setup_ssh_key = "y" ]]; then
    source ssh-key-setup.sh
fi

if [[ $install_nvm = "y" ]] && [[ $install_node != "y" ]]; then
    source install-nvm.sh
fi

if [[ $install_node = "y" ]]; then
    source install-nvm.sh
    source install-node.sh
fi

if [[ $install_rbenv = "y" ]] && [[ $install_ruby != "y" ]] && [[ $install_rails != "y" ]]; then
    source install-ruby-1.sh
fi

if [[ $install_ruby = "y" ]] && [[ $install_rails != "y" ]]; then
    source install-ruby-1.sh
    restart
    source install-ruby-2.sh
fi

if [[ $install_rails = "y" ]]; then
    source install-ruby-1.sh
    restart
    source install-ruby-2.sh
    source install-rails.sh
    source install-yarn.sh
fi

if [[ $install_yarn = "y" ]]; then
    source install-yarn.sh
fi

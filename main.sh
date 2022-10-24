#!/bin/bash -i

source get-os-flavor.sh
os_flavor=$(get_os)

source vars.sh

# get user desired config

read -p "install all? y/n " install_all

if [[ $install_all = "y" ]]; then
  configure_git="y"
  setup_ssh_key="y"
  install_node="y"
  install_rails="y"
else
  read -p "configure git? y/n " configure_git

  read -p "setup SSH key? y/n " setup_ssh_key

  read -p "install node? (also installs NVM) y/n " install_node

  read -p "install rails? (also installs ruby, env, and yarn) y/n " install_rails
fi

if [[ $install_rails != "y" ]]; then
  read -p "install ruby? (also installs rbenv) y/n " install_ruby
fi

if [[ $install_ruby != "y" ]] && [[ $install_rails != "y" ]]; then
  read -p "install rbenv? y/n " install_rbenv
fi

if [[ $install_rails != "y" ]]; then
  read -p "install yarn? y/n " install_yarn
fi

if [[ $email = "user@example.com" ]] && [[ $configure_git = "y" ]] || [[ $setup_ssh_key = "y" ]]; then
  read -p "Enter email to use for Git. Note: this email will be visible on all commits to public repos " email
fi

if [[ $username = "User" ]] && [[ $configure_git = "y" ]]; then
  read -p "Enter username to use for Git. Note: this will also be visible on all commits to public repos " username
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
    source prepare-install-rbenv.sh
    source $profile_file
    source install-rbenv.sh
fi

if [[ $install_ruby = "y" ]] && [[ $install_rails != "y" ]]; then
    source prepare-install-rbenv.sh
    source $profile_file
    source finish-ruby-installation.sh
fi

if [[ $install_rails = "y" ]]; then
    source prepare-install-rbenv.sh
    source $profile_file
    source finish-rails-installation.sh
fi

if [[ $install_yarn = "y" ]]; then
    source install-yarn.sh
fi

echo "Installations complete"

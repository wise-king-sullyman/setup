#!/bin/bash

source get-os-flavor.sh
os_flavor=$(get_os)

source vars.sh

source git-config-setup.sh

source ssh-key-setup.sh

source install-nvm.sh

source install-node.sh

source install-ruby-1.sh

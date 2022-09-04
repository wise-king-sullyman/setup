#!/bin/bash

source get-os-flavor.sh
os_flavor=get_os

source vars.sh

source git-config-setup.sh

source ssh-key-setup.sh

source install-nvm-fedora.sh

source install-node.sh


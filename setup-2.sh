#!/bin/bash

source get-os-flavor.sh
os_flavor=$(get_os)

source vars.sh

source install-ruby-2.sh

source install-rails.sh

source install-yarn.sh
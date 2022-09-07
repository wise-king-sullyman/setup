#!/bin/bash

source get-os-flavor.sh
os_flavor=$(get_os)

source vars.sh

source install-rbenv.sh

source install-ruby.sh
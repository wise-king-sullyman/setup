#!/bin/bash

rbenv install $ruby_target_version --verbose

rbenv global 3.1.2
ruby -v

read -p "ruby is installed if a ruby version is returned above. Press enter to continue."
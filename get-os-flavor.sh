#!/bin/bash

get_os () {
  source /etc/os-release

  OS_NAME=$PRETTY_NAME
  FEDORA="Fedora"

  case $OS_NAME in

    *"Fedora"*)
      echo fedora
    ;;
    
    *"Ubuntu"*)
      echo ubuntu
    ;;

    *)
      echo unidentified
    ;;
  esac
}
#!/bin/bash

SSHPUBKEY=~/.ssh/id_ed25519.pub

if test -e "$SSHPUBKEY"; then
  echo "$SSHPUBKEY exists"
else
  echo "$SSHPUBKEY does not exists. Creating keys"
  ssh-keygen -t ed25519 -C $email
fi

cat $SSHPUBKEY

echo "copy key and add to GitHub. Press enter when done to continue."

read

ssh -T git@github.com
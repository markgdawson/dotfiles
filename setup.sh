#!/bin/bash
# Move to home directory
cd
# Move all current config files to git repo (so we can do git diff)
(cd ~/.dotfiles; git ls-files) | xargs -I {} mv {} .dotfiles/
# Symlink files to git repo files
(cd ~/.dotfiles; git ls-files) | xargs -I {} ln -s ~/.dotfiles/{} {}

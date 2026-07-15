#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 <number-of-generations-to-keep>"
    exit 1
fi

echo "Deleting old system generations..."
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +$1

echo "Deleting old user generations..."
nix-env --profile ~/.local/state/nix/profiles/profile --delete-generations +$1

echo "Running gc and store optimization..."
sudo nix-store --gc
sudo nix-store --optimize

echo "Garbage collection complete."

#Hello!
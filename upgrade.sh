#!/bin/sh -eu
nix-prefetch-git \
  git@github.com:NixOS/nixpkgs-channels \
  --rev refs/heads/nixpkgs-unstable \
  --no-deepClone \
  > nixpkgs.json

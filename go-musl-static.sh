#!/bin/sh -eu
nix-shell shell.nix --command "./build.sh $*"

# `go-musl-static`

If you want a static build of a Go command, and you have Nix
installed, this might help.

## Requirements

- [Nix](https://nixos.org/download.html#nix-quick-install)
  - If you don't have Nix installed, you might want to just read and
    adapt [build.sh](./build.sh)

## Usage

Run `./go-musl-static.sh <PKG> <OUTFILE>`, binary appears.

```sh
$ ./go-musl-static.sh "github.com/astaxie/bat" /tmp/static-bat
go: finding module for package github.com/astaxie/bat
go: found github.com/astaxie/bat in github.com/astaxie/bat v0.0.2
/tmp/static-bat: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=TPTIsZyaMoeabjFnwNvZ/DItRModjhafiCDcPh0ql/915KHASnzX7vCrsIuAU5/CJiHV9FMd_05444ZyQUC, stripped
11M     /tmp/static-bat
/tmp/static-bat
```

Toolchain can be upgraded via `upgrade.sh`.

## Details

- shell.nix pulls in recent versions of go and musl
  - locked to specific nixpkgs revision so it doesn't break
- build.sh sets the right `go build` incantation
- binary is stripped

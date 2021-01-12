let
  nixpkgs =
    let
      path = ./. + "/nixpkgs.json";
      json = builtins.fromJSON (builtins.readFile path);
    in
      import ((import <nixpkgs> { }).fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs";
        inherit (json) rev sha256;
      }) { config = { }; };
in
  with nixpkgs;
    pkgs.mkShell {
      buildInputs = [
        pkgs.go
        pkgs.musl
        pkgs.musl.dev
        pkgs.nix-prefetch-git
      ];

      shellHook = ''
        unset GOPATH
      '';
    }

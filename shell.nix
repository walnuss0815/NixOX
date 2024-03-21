{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = [
    nixpkgs.nixfmt
    ];
}

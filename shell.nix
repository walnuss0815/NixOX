{ nixpkgs ? import <nixpkgs> {}}:

nixpkgs.mkShell {
  packages = [
    nixpkgs.nixfmt
    ];
}

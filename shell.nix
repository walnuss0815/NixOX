{ nixpkgs ? import <nixpkgs> { } }:

nixpkgs.mkShell { packages = [ nixpkgs.nixpkgs-fmt ]; }

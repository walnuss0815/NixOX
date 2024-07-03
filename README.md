# walnuss0815 NixOS


## Build System (Local)

```bash
sudo nixos-rebuild switch --flake .#alexander-nb2
```

## Build System (Remote)

```bash
nixos-rebuild switch --flake .#frigate --target-host alexander@192.168.10.134 --build-host alexander@192.168.10.134 --use-remote-sudo
```

## Build Home

```bash
home-manager switch --flake .#alexander
```

## Update Flake

```bash
nix flake update
```

{ config, pkgs, lib, ... }: {
  services.netbird.enable = true; # for netbird service & CLI
  environment.systemPackages = [ pkgs.netbird-ui ]; # for GUI
  systemd.services.netbird-wt0.wantedBy = lib.mkForce []; # disable autostart
}

{ pkgs, config, ... }: {
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Budgie Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.budgie = {
    enable = true;
    extraPlugins = [ pkgs.budgie-analogue-clock-applet ];
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}

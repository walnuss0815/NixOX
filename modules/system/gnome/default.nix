{ pkgs, config, ... }: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;
    excludePackages = [ pkgs.xterm ];

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Enable XMonad Desktop Environment
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = builtins.readFile ./xmonad.hs;
      };
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}

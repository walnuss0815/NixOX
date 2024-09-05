{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    adwaita-icon-theme
  ];
}

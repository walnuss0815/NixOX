{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    neofetch
    nnn # terminal file manager
  ];

  programs.direnv = {
    enable = true;
    nix-direnv = { enable = true; };
  };

  programs.thefuck = { enable = true; };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "direnv" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ll = "ls -alh";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}

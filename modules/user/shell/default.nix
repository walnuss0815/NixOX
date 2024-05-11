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
      update = "sudo nixos-rebuild switch";
      urldecode =
        "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode =
        "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}

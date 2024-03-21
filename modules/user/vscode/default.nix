{ pkgs, config, ... }: {
  programs.vscode = {
    enable = true;
    userSettings = {
      "workbench.startupEditor" = "none";
      "explorer.confirmDelete" = false;
      "git.autofetch" = true;
      "files.eol" = "\n";
      "files.insertFinalNewline" = true;
      "cSpell.language" = "en;en-US;de-DE";
      "editor.bracketPairColorization.enabled" = true;
      "editor.rulers" = [ 80 125 ];
      "git.suggestSmartCommit" = false;
      "editor.renderWhitespace" = "all";
      "window.titleBarStyle" = "custom";
    };
    extensions = [
      pkgs.vscode-extensions.eamodio.gitlens
      pkgs.vscode-extensions.oderwat.indent-rainbow
      pkgs.vscode-extensions.streetsidesoftware.code-spell-checker
    ];
  };
}

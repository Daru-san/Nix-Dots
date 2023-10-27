{config, pkgs, ...}:{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    keybindings = [
      
    ];
    extensions = [

    ];
  };
}

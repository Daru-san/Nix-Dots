{config, pkgs, ...}:{
  imports = [
    #Import languages for coding(To be changed to custom shells at some point)
    ./Java/java.nix
    ./Python/python.nix
    ./vscode/default.nix
  ];
}

{config, pkgs, ...}:{
  imports = [
  #Import home settings
    ./Shell/default.nix
    ./pkgs/default.nix
    ./Audio/default.nix
  ];
  home.packages = with pkgs; [
    #Add glibc for NvChad
    glib
  ];
}

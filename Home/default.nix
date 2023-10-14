{...}:{
  imports = [
    ./Desktop/default.nix
    ./Programs/default.nix
    ./Settings/default.nix
  ];
  home.stateVersion = "23.11";
  home.username = "daru";
  home.homeDirectory = "/home/daru";
  programs.home-manager.enable = true;
}

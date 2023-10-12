{config, pkgs, ...}:{
  imports = [
    ./Spotify/spotify.nix
    ./cmus/cmus.nix
  ];
  home.packages = with pkgs; [
    cava
    
  ];
}

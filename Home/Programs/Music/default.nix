#Music configuration
{config, pkgs, ...}:{
  imports = [
    ./Spotify/spotify.nix
    ./cmus/cmus.nix
  ];
  home.packages = with pkgs; [
#Packages for music
    cava
    ytui-music    
  ];
}

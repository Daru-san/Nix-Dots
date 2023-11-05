{config, pkgs, ...}:
{ 
  home.packages = with pkgs; [
    ani-cli
    
    #Dependancies
    mpv
    vlc
  ];
}

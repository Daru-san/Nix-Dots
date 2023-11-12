#Ani cli config, terminal anime client
{config, pkgs, ...}:
{ 
  home.packages = with pkgs; [
    ani-cli

    #For anilist tracking
    anup
    
    #Dependancies
    mpv
    vlc
  ];
}

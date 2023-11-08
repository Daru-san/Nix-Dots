#Wallpaper config
{config, pkgs, lib, ...}:{
  home.packages = with pkgs; [
    swww #Wallpaper support for wayland

    #Script for wallpaper
    (pkgs.writeShellScriptBin "wall-script" ''
         pkill swww-daemon
         sleep 3 
         swww init
         sleep 2
         swww img $1 
     '')
  ];
#Clone wallpapers repo 'github.com/D3Ext/aesthetic-wallpapers'
  home.file."Wallpapers" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "D3Ext";
      repo = "aesthetic-wallpapers";
      rev = "9925e5c764e68ddaaecff6afb0991d80939ec1f9";
      sha256 = "u6QzTa5VScOZHbO/5WRORjbuQoCA5C774f1z1TTH87k=";
    };
  };
}

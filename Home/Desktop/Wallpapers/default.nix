#Wallpaper config
{config, pkgs, lib, ...}:{
  home.packages = with pkgs; [
    swww #Wallpaper support for wayland
    #swaybg #uncomment to enable swaybg

    #Script for wallpaper(you can use it choose between sway and swww depending on your setup)
    (pkgs.writeShellScriptBin "wall-script" ''
      kill() {
        pkill swww-daemon
        pkill swaybg
        sleep 3
        notify-send 'Killed all wallpaper daemons'
      }
      print_usage() {
        printf "usage: wall-script -w (wallpaper program:swww or swaybg) -i (image)"
      }
      while getopts w:i:k:h: flag #w for wallpaper program(swaybg or swww); i for image
    do
      case "$flag" in
         w) program=$OPTARG;;
         i) image=$OPTARG;;
         k) kill
            exit 1;;
         h) print_usage
            exit 1;;
      esac
    done
         if [[ $program = "swww" ]]
          then
            echo "using swww for wallpaper"
            pkill swww-daemon
            swww init
            sleep 2
            swww img $image
            notify-send "Wallpaper has been set successfully"
         elif [[ $program = "swaybg" ]]
          then
            echo "using swaybg for wallpaper"
            pkill swaybg
            swaybg -i $image
            notify-send "Wallpaper has been set successfully"
        else
          notify-send "Wallpaper daemon not specified, please specify one in the config"
        fi   
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

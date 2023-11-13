{config, pkgs, ...}:{
  imports = [
    ./gtk/gtk.nix
    ./Waybar/waybar-theme.nix
    ./hypr/colors.nix
  ];
}

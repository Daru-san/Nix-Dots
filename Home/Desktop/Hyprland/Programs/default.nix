{pkgs, config, ...}:{
  imports = [
    ./rofi/rofi.nix
    ./kitty.nix
    ./swayosd.nix
    ./waybar.nix
    ./playerctl.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard #Clipboard
    swaynotificationcenter
    hyprpicker #I need to get this to work with extensions
    cool-retro-term #Nice terminal
    wtype #Clipboard
  ];
  home.sessionVariables = {
    TERMINAL = "${config.programs.kitty.package}/bin/kitty";
#Make kitty default terminal
  };
}

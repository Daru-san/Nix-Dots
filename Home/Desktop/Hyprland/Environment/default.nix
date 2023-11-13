{pkgs, config, ...}:{
  imports = [
    ./rofi/rofi.nix
    ./kitty.nix
    ./swayosd.nix
    ./swaylock.nix
    ./waybar.nix
    ./playerctl.nix
    # ./kanshi.nix
    ./copyq.nix
    ./anyrun.nix
    ./swayidle.nix
  ];
  home.packages = with pkgs; [
    swaynotificationcenter
    hyprpicker #I need to get this to work with extensions
    cool-retro-term #Nice terminal
  ];
  home.sessionVariables = {
    TERMINAL = "${config.programs.kitty.package}/bin/kitty";
#Make kitty default terminal
  };
}

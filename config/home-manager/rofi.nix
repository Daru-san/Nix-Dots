{config, pkgs, ...}:{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
      # rofi-bluetooth
      # rofi-power-menu
      rofi-top
      rofi-emoji
      # rofi-screenshot
      # rofi-pulse-select
    ];
    font = "Jetbrains Mono Nerd Font 14";
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "~/.config/rofi/launchers/type-1/style-6.rasi";
    extraConfig = {
      modes = ["drun" "run" "window" "files" "calc" "top"];
    };
  };
  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-pulse-select
    rofi-screenshot
    rofi-power-menu
  ];
}

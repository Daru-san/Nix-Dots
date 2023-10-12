{config, pkgs,lib, ...}:{
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
    theme = "./Themes/Styles/type-1/style-6.rasi";
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
  home.file.".config/rofi/colors".source = config.lib.file.mkOutOfStoreSymlink ./Themes/colors;
}

{pkgs, config, ...}:{
  imports = [
    ./rofi/rofi.nix
    ./kitty.nix
    ./waybar.nix
    ./playerctl.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    gnome3.nautilus
    rabbitvcs
    swaynotificationcenter
    hyprpicker
    cool-retro-term
    wtype
  ];
  home.sessionVariables = {
    TERMINAL = "${config.programs.kitty.package}/bin/kitty";
    # EDITOR = "${config.programs.neovim.package}/bin/nvim";
  };
}

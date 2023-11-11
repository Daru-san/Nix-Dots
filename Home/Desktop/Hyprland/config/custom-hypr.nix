{config, pkgs, ...}:{
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.hdrop
  ];
}

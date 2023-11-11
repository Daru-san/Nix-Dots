{config, pkgs, inputs, ...}:{
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.hdrop
  ];
}

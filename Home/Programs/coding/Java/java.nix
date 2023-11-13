{config, pkgs, ...}:{
  home.packages = with pkgs; [
    openjdk17
    openjdk8
  ];
}

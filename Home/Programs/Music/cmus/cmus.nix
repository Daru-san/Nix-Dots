{config, pkgs, ...}:{
  home.packages = with pgks; [
    cmus
  ];
}

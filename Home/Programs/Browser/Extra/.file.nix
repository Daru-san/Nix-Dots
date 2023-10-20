{config, pkgs, ...}:{
  home.packages = with pkgs; [
    ahoviewer
    imgbrd-grabber
  ];
}

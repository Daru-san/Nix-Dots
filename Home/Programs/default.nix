{config, pkgs, lib, ...}:{
  imports = [
    ./cli/default.nix
    ./Music/default.nix
    # ./Games/default.nix
    ./coding/default.nix
    ./Browser/default.nix
  ];
  home.packages = with pkgs; [
    libreoffice-fresh
    obsidian
    #gimp
    mission-center
    newsflash
    evince
    gnome3.nautilus
    nautilus-open-any-terminal
    gnome.nautilus-python
    freetube
    komikku
    gthumb
    scrcpy
    localsend
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian"
  ];
}

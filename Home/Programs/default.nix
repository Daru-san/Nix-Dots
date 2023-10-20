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
    gimp
    wpsoffice
    mission-center
    # libsForQt5.akregator
    newsflash
    # libsForQt5.okular
    evince
    gnome3.nautilus
    nautilus-open-any-terminal
    gnome.nautilus-python
    gnome.sushi
    rabbitvcs
    freetube
    komikku
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian" "wpsoffice"
  ];
}

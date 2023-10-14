{config, pkgs, lib, ...}:{
  home.packages = with pkgs; [
    swww
  ];
  home.file."Wallpapers" = {

    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "D3Ext";
      repo = "aesthetic-wallpapers";
      rev = "9925e5c764e68ddaaecff6afb0991d80939ec1f9";
      sha256 = "u6QzTa5VScOZHbO/5WRORjbuQoCA5C774f1z1TTH87k=";
    };
  };
  home.file."Wallpapers/current".source = config.lib.file.mkOutOfStoreSymlink "~/Wallpapers/images/4k-keyboard.jpg";
}

{config, ...}:{
  imports = [
    ./Shell/default.nix
    ./pkgs/default.nix
    ./Audio/default.nix
  ];
  home.packages = with pkgs; [
    glib
  ];
}

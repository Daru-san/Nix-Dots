{config, pkgs, ...}:
let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in
{
  

  home.file.".config/nixpkgs/config.nix".text = ''
    {
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
  '';
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
  };
}

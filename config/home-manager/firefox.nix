{config, pkgs, ...}: 
let
  
in
  {
    programs.firefox = {
      package = pkgs.firefox-unwrapped;

    }
  }


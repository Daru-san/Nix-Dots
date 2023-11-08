# {config, pkgs, ...}:{
#     # imports = [
#     #         nix-doom-emacs.homeManagerModule
#     #       ];
#     programs.doom-emacs = {
#       enable = true;
#       doomPrivateDir = "~/.doom.d";
#     };
#     services.emacs.enable = true;
#     home.file.".doom.d".source = config.lib.file.mkOutOfStoreSymlink ./doom.d;
#   }

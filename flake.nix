{
  description = "My NixOS home-manager flake, ft. Hyprland, spicetify and others ";
  #Here's this little comment I'm gonna add here just because I can
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable; #Pin to nixpkgs unstable
    nur.url = github:nix-community/NUR; #Add nur repo for firefox plugins
    spicetify-nix.url = github:the-argus/spicetify-nix/master; #Add spicetify to flake
    home-manager = {
      url = github:nix-community/home-manager/master;
      # home manager use our nixpkgs and not its own
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      #Add Hyprland to home config
      url = github:hyprwm/Hyprland;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs"; #Add doom-emacs to config
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    spicetify-nix,
    hyprland,
    nur,
    nix-doom-emacs,
    ...
  } @ inputs: let
    username = "daru";
    supportedSystems = [
      "x86_64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system: import nixpkgs {inherit system;});
    modules = [
        hyprland.homeManagerModules.default #Enable Hyprland
        {wayland.windowManager.hyprland.enable = true;}
        {nixpkgs.overlays = [ nur.overlay ];}
    ];
    config = {
      allowUnfree = true;
    };
    stateVersion = "unstable";
  in {
    packages = genSystems (system: {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs.${system};
        modules = [
          ./Home/default.nix #Add home config
          {nixpkgs.overlays = [ nur.overlay ];}
          {imports = [
            nix-doom-emacs.hmModule
          ];
           programs.doom-emacs = {
            enable = false; #Disable for now to be re-enabled later on
            doomPrivateDir = ./Home/Programs/cli/emacs/doom.d;
            };
          }
        ];
        extraSpecialArgs =
          inputs
          // {
            inherit username hyprland nix-doom-emacs;
          };
      };
    });
  };
}


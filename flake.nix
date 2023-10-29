{
  description = "My NixOS home-manager configuration ft. Hyprland";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nur.url = "github:nix-community/NUR";
    spicetify-nix.url = github:the-argus/spicetify-nix;
    home-manager = {
      url = github:nix-community/home-manager;
      # home manager use our nixpkgs and not its own
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    spicetify-nix,
    hyprland,
    nur,
    ...
  } @ inputs: let
    username = "daru";


    homeConfigUserString = username;
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system: import nixpkgs {inherit system;});
    modules = [
        hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
        {nixpkgs.overlays = [ nur.overlay ];}
        # ...
    ];

    # not these though
    stateVersion = "unstable";
  in {
    packages = genSystems (system: {
      homeConfigurations.${homeConfigUserString} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs.${system};
        modules = [
            ./Home/default.nix
            {nixpkgs.overlays = [ nur.overlay ];}
            ];
        extraSpecialArgs =
          inputs
          // {
            inherit username hyprland;
          };
      };
    });
  };
}


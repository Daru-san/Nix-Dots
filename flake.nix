{
  description = "My NixOS home-manager flake, ft. Hyprland, spicetify and others ";
  inputs = {
    ##Nixpkgs inputs##

    #Pin nixpkgs to unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #Nur input
    nur.url = "github:nix-community/NUR";

    #Home manager input
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # home manager use our nixpkgs and not its own
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Spicetify input
    spicetify-nix.url = "github:the-argus/spicetify-nix/master";

    #Hyprland inputs
    hyprland = {
      #Add Hyprland to home config
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      #Hyprland-contrib for hyprland specific packages
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Neovim input
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    #Prism launcher
    prismlauncher.url = "github:Diegiwg/PrismLauncher-Cracked";

    #anyrun
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
    outputs = { 
      nixpkgs, 
      home-manager,
      hyprland,
      nur,
      spicetify-nix,
      hyprland-contrib,
      prismlauncher,
      anyrun,
      ...} @ inputs: let     

         #Allowing unfree packages
        config = {
          allowUnfree = true;
        };

        #Overlay for neovim-nightly
        overlays = [
          inputs.neovim-nightly-overlay.overlay
        ];

          #Pin to unstable
        stateVersion = "unstable";

        modules = [
          #Enable Hyprland
          hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland.enable = true;}
        ];

        pkgs = import nixpkgs { system = "x86_64-linux"; };

    in {
      homeConfigurations."daru" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs hyprland nur spicetify-nix hyprland-contrib overlays prismlauncher anyrun;};
        modules = [
          #Import home configs
          ./Home/default.nix 

          #Add nur to home outputs
          {nixpkgs.overlays = [ nur.overlay ];} 

           #Add nixpkgs overylays for neovim-nightly
          {nixpkgs.overlays = overlays;}
        ];
      };
  };
}
#Random comment

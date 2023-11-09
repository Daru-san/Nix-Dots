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
    #nix-doom-emacs.url = "github:nix-community/nix-doom-emacs"; #Add doom-emacs to config(disabled for the time being)
  };
    outputs = { 
      nixpkgs, 
      home-manager,
      hyprland,
      nur,
      spicetify-nix,
      ...} @ inputs: let     
        
        config = {
          allowUnfree = true;
        };

        stateVersion = "unstable";

        modules = [
          hyprland.homeManagerModules.default #Enable Hyprland
          {wayland.windowManager.hyprland.enable = true;}
        ];

        pkgs = import nixpkgs { system = "x86_64-linux"; };

    in {
      homeConfigurations."daru" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs hyprland nur spicetify-nix;};
        modules = [
          ./Home/default.nix
          ./Wallpapers/default.nix
          {nixpkgs.overlays = [ nur.overlay ];}
        ];
      };
    };
}


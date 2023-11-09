{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify = let
    officialThemes = pkgs.fetchgit {
      url = "https://github.com/spicetify/spicetify-themes";
      sha256 = "0sab8jh4867fh66zdz7msg1bwwqpm0zc6y20hw7328p7agcr7xlk";
      rev = "2e124a90561649a8aa410e89c6893e5b5d4816b9";
    };
  in 
    {
#Enable spicetify
      enable = true;
#Spicetify theme
      theme = {
        name = "text";
        src = officialThemes;
        appendName = true;
        injectCss = true;
        replaceColors = true;
        overwriteAssets = true;
        sidebarConfig = true;
        patches = {
          "xpui.js_find_0880" = "COLLAPSED\?64:32";
          "xpui.js_repl_0880" = "COLLAPSED?32:32";
          "xpui.js_find_8008" = ",(\w+=)56,";
          "xpui.js_repl_8008" = ",$1}32,";
        };
      };
      colorScheme = "Kanagawa";

      enabledExtensions = with spicePkgs.extensions; [
#Extensions for spicetify
        fullAppDisplayMod
        loopyLoop
        powerBar
        seekSong
        bookmark
        autoVolume
        historyShortcut
        copyToClipboard
        genre
        volumePercentage
        playNext
        savePlaylists
        adblock
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        lastfm
        playlistIcons
        goToSong
        listPlaylistsWithSong
        featureShuffle
        playlistIntersection
        skipOrPlayLikedSongs
      ];
      enabledCustomApps = with spicePkgs.apps; [
#Custom apps
        new-releases
        marketplace
        localFiles
        lyrics-plus
      ];
    };

    #Spotifd service for spotify-tui
    services.spotifyd = {
      enable = true;
      settings = {
          global = {
              username = "31qfp7msrlxcryx2zwhoa2lbts5u";
          };
      };
    };
  home.packages = with pkgs; [
    spotify-tui #Spotify-tui for terminal usage
  ];
}

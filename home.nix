{ config, pkgs, lib, ... }:

{
  imports = [
        ./config/home-manager/zsh.nix
        ./config/home-manager/hyprland.nix
        ./config/home-manager/git.nix
        ./config/home-manager/btop.nix
        ./config/home-manager/spotify.nix
        ./config/home-manager/nvim.nix
        ./config/home-manager/waybar.nix
        ./config/home-manager/sway.nix
        ./config/home-manager/scripts.nix
        ./config/home-manager/swayidle.nix
        ./config/home-manager/rofi.nix
        # ./whatsie.nix
        ];

  home.username = "daru";
  home.homeDirectory = "/home/daru";
##edit.bruh
##edit2.0 bruv

  home.stateVersion = "23.11"; 
  ##gtk 
  gtk = {
      enable = true;
      theme = {
          name = "Fluent-Dark";
          package = pkgs.fluent-gtk-theme;
        };
      iconTheme = {
          name = "ePapirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
    };
  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs; [
    #Hi
      hello

    #Hyprland stuff

    alacritty
    iw
    bc
    hyprpicker
    grim
    slurp
    cool-retro-term

    libreoffice-fresh
    # wpsoffice
    wlr-randr

    swaynotificationcenter
    swaybg
    swww
    mpd
    mpc-cli
    swayidle
    swaylock
    mc
    wl-clipboard
    wtype
    obsidian
    gimp
    wpsoffice
    cliphist
    mission-center
    transmission
    


    #others
    losslesscut-bin
    htop
    nchat

    ani-cli
    fluent-reader
    libsForQt5.akregator
    cmus
    audacious
    cava
    # obsidian
    tty-clock
    mpv
    scrcpy
    playerctl

    papirus-icon-theme
    
    #Thunar(File manager)
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin



    spotify-tui
    libnotify
    # spotify
    chroma
    ddgr
    cbonsai
    bastet
    yt-dlp
   
    #Java
    openjdk17
  (nerdfonts.override { fonts = [ "JetBrainsMono" "RobotoMono" ]; })


  ];
  # programs.rofi.overide 

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian" "wpsoffice" "spotify"
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    "${config.xdg.configHome}" = {
        source = "config";
        recursive = true;
        };
    ".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
    # "~/.config/ranger/rc.conf".source = "~/Nix-Dots/config/ranger/rc.conf";
    # ".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
    # ".config/neofetch/config.conf".source = "neofetch/config.conf";
    # ".config/neofetch/anifetch.conf".source = "neofetch/anifetch.conf";

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  home.sessionVariables = {
    EDITOR = "nvim";
  };
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

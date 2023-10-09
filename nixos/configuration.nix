{ config, pkgs, ... }:
#random little comment
{
 
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #TLP for power and performance tweaks
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  #Performance tweaks
  powerManagement = {
  	enable = true;
	cpuFreqGovernor = "performance";
  };

  #Hyprland
  programs.hyprland.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  #ZSH config
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #For Sway and Swaylock
  security.polkit.enable = true;
  security.pam.services.swaylock.text = ''
    auth include login
  '';

  networking.hostName = "AspireNixRemux"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Networking config
  networking = {
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];
    networkmanager.dns = "none";
  };
  #Bluetooth configuration
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;


  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = false;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;
  programs.gnome-disks.enable = true;
  
  #KDE
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "za";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable adb, android FTP and waydroid.
  programs.adb.enable = true;
  services.gvfs.enable = true;
  virtualisation.waydroid.enable = true;

  #User configs
  users.users = {
    daru = {
      isNormalUser = true;
      description = "Darryl";
      extraGroups = [ "networkmanager" "wheel" "video" "adbusers"];
      packages = with pkgs; [
       firefox
      ];
    };
    #Disables root user
    root.hashedPassword = "!";
    # mutableUsers = false;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [    
    neofetch
    ranger
    killall
    htop
    most
    git
    gnome.file-roller
    gparted
    gnome.gnome-software
    gnome3.nautilus
    discover
    ncdu
    cpupower-gui
    pavucontrol
    pulsemixer
    #gnome3.gnome-tweaks
    wget
    jmtpfs
    nix-prefetch-git
    nix-prefetch-github
    gcc
    nodejs_20
    unzip
    clang
    zig
  ];

  #Neovim config
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ vim-nix ];
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
     enable = true;
     # require public key authentication for better security
     settings.PasswordAuthentication = false;
     settings.KbdInteractiveAuthentication = false;
     #settings.PermitRootLogin = "yes";
};


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

  #KDE polkit for hyprland
  systemd = {
  user.services.polkit-kde-agent = {
    description = "kde polkit";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};


}

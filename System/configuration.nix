{ config[1m[30m,[0m pkgs[1m[30m,[0m [1m[30m...[0m }:
[3m[32m#random little comment[0m
{
 
  imports [1m[30m=[0m
    [ [3m[32m# Include the results of the hardware scan.[0m
      [33m./hardware-configuration.nix[0m
    ];
    
[3m[32m#Add nurpkgs[0m
  nixpkgs[1m[30m.[0mconfig[1m[30m.[0mpackageOverrides [1m[30m=[0m pkgs: {
    nur [1m[30m=[0m [1m[1m[35mimport[0m ([1m[35mbuiltins[0m[1m[30m.[0m[1m[35mfetchTarball[0m [1m[30m"https://github.com/nix-community/NUR/archive/master.tar.gz"[0m) {
      [1m[1m[35minherit[0m pkgs;
    };
  };
  [3m[32m#enable flakes[0m
  nix[1m[30m.[0msettings[1m[30m.[0mexperimental-features [1m[30m=[0m [ [1m[30m"nix-command"[0m [1m[30m"flakes"[0m ];

  [3m[32m#TLP for power and performance tweaks[0m
  services[1m[30m.[0mtlp[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  services[1m[30m.[0mpower-profiles-daemon[1m[30m.[0menable [1m[30m=[0m [31mfalse[0m;
  [3m[32m#Performance tweaks[0m
  powerManagement [1m[30m=[0m {
  	enable [1m[30m=[0m [31mtrue[0m;
	cpuFreqGovernor [1m[30m=[0m [1m[30m"performance"[0m;
  };

  [3m[32m#Hyprland[0m
  programs[1m[30m.[0mhyprland[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;

  [3m[32m# Flatpak[0m
  services[1m[30m.[0mflatpak[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;

  [3m[32m#ZSH config[0m
  programs[1m[30m.[0mzsh[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  users[1m[30m.[0mdefaultUserShell [1m[30m=[0m pkgs[1m[30m.[0mzsh;
  environment[1m[30m.[0mshells [1m[30m=[0m [1m[1m[35mwith[0m pkgs; [ zsh ];

  [3m[32m# Bootloader.[0m
  boot[1m[30m.[0mloader[1m[30m.[0msystemd-boot[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  boot[1m[30m.[0mloader[1m[30m.[0mefi[1m[30m.[0mcanTouchEfiVariables [1m[30m=[0m [31mtrue[0m;

  [3m[32m#For Sway and Swaylock[0m
  security[1m[30m.[0mpolkit[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  security[1m[30m.[0mpam[1m[30m.[0mservices[1m[30m.[0mswaylock[1m[30m.[0mtext [1m[30m=[0m [1m[30m''
    auth include login
  ''[0m;

  networking[1m[30m.[0mhostName [1m[30m=[0m [1m[30m"AspireNixRemux"[0m; [3m[32m# Define your hostname.[0m
  [3m[32m# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.[0m

  [3m[32m# Configure network proxy if necessary[0m
  [3m[32m# networking.proxy.default = "http://user:password@proxy:port/";[0m
  [3m[32m# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";[0m

  [3m[32m# Networking config[0m
  networking [1m[30m=[0m {
    networkmanager[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
    nameservers [1m[30m=[0m [[1m[30m"1.1.1.1"[0m [1m[30m"1.0.0.1"[0m];
    networkmanager[1m[30m.[0mdns [1m[30m=[0m [1m[30m"none"[0m;
  };
  [3m[32m#Bluetooth configuration[0m
  services[1m[30m.[0mblueman[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  hardware[1m[30m.[0mbluetooth[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;


  [3m[32m# Set your time zone.[0m
  time[1m[30m.[0mtimeZone [1m[30m=[0m [1m[30m"Africa/Johannesburg"[0m;

  [3m[32m# Select internationalisation properties.[0m
  i18n[1m[30m.[0mdefaultLocale [1m[30m=[0m [1m[30m"en_ZA.UTF-8"[0m;

  [3m[32m# Enable the X11 windowing system.[0m
  services[1m[30m.[0mxserver[1m[30m.[0menable [1m[30m=[0m [31mfalse[0m;

  [3m[32m# Enable the GNOME Desktop Environment.[0m
  services[1m[30m.[0mxserver[1m[30m.[0mdisplayManager[1m[30m.[0mgdm[1m[30m.[0menable [1m[30m=[0m [31mfalse[0m;
  services[1m[30m.[0mxserver[1m[30m.[0mdesktopManager[1m[30m.[0mgnome[1m[30m.[0menable [1m[30m=[0m [31mfalse[0m;
  programs[1m[30m.[0mgnome-disks[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  
  [3m[32m#KDE[0m
  services[1m[30m.[0mxserver[1m[30m.[0mdisplayManager[1m[30m.[0msddm[1m[30m.[0menable [1m[30m=[0m [31mfalse[0m;
  services[1m[30m.[0mxserver[1m[30m.[0mdesktopManager[1m[30m.[0mplasma5[1m[30m.[0menable [1m[30m=[0m [31mfalse[0m;

  [3m[32m# Configure keymap in X11[0m
  services[1m[30m.[0mxserver [1m[30m=[0m {
    layout [1m[30m=[0m [1m[30m"za"[0m;
    xkbVariant [1m[30m=[0m [1m[30m""[0m;
  };

  [3m[32m# Enable CUPS to print documents.[0m
  services[1m[30m.[0mprinting[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;

  [3m[32m# Enable sound with pipewire.[0m
  sound[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  [3m[32m# hardware.pulseaudio.enable = true;[0m
  security[1m[30m.[0mrtkit[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  services[1m[30m.[0mpipewire [1m[30m=[0m {
    enable [1m[30m=[0m [31mtrue[0m;
    alsa[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
    alsa[1m[30m.[0msupport32Bit [1m[30m=[0m [31mtrue[0m;
    pulse[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
    [3m[32m# If you want to use JACK applications, uncomment this[0m
    [3m[32m#jack.enable = true;[0m

    [3m[32m# use the example session manager (no others are packaged yet so this is enabled by default,[0m
    [3m[32m# no need to redefine it in your config for now)[0m
    [3m[32m#media-session.enable = true;[0m
  };

  [3m[32m# Enable touchpad support (enabled default in most desktopManager).[0m
  [3m[32m# services.xserver.libinput.enable = true;[0m

  [3m[32m# Enable adb, android FTP and waydroid.[0m
  programs[1m[30m.[0madb[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  services[1m[30m.[0mgvfs[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;
  virtualisation[1m[30m.[0mwaydroid[1m[30m.[0menable [1m[30m=[0m [31mtrue[0m;

  [3m[32m#User configs[0m
  users[1m[30m.[0musers [1m[30m=[0m {
    daru [1m[30m=[0m {
      isNormalUser [1m[30m=[0m [31mtrue[0m;
      description [1m[30m=[0m [1m[30m"Darryl"[0m;
      extraGroups [1m[30m=[0m [ [1m[30m"networkmanager"[0m [1m[30m"wheel"[0m [1m[30m"video"[0m [1m[30m"adbusers"[0m];
      packages [1m[30m=[0m [1m[1m[35mwith[0m pkgs; [
       firefox
      ];
    };
    [3m[32m#Disables root user[0m
    root[1m[30m.[0mhashedPassword [1m[30m=[0m [1m[30m"!"[0m;
    [3m[32m# mutableUsers = false;[0m
  };

  [3m[32m# Allow unfree packages[0m
  nixpkgs[1m[30m.[0mconfig[1m[30m.[0mallowUnfree [1m[30m=[0m [31mtrue[0m;

  [3m[32m# List packages installed in system profile. To search, run:[0m
  [3m[32m# $ nix search wget[0m
  environment[1m[30m.[0msystemPackages [1m[30m=[0m [1m[1m[35mwith[0m pkgs; [    
    neofetch
    ranger
    killall
    htop
    most
    git
    gnome[1m[30m.[0mfile-roller
    gparted
    gnome[1m[30m.[0mgnome-software
    gnome3[1m[30m.[0mnautilus
    discover
    ncdu
    cpupower-gui
    pavucontrol
    pulsemixer
    [3m[32m#gnome3.gnome-tweaks[0m
    wget
    jmtpfs
    nix-prefetch-git
    nix-prefetch-github
    gcc
    nodejs_20
    unzip
    clang
    zig
    iw
  ];

  [3m[32m#Neovim config[0m
  programs[1m[30m.[0mneovim [1m[30m=[0m {
    enable [1m[30m=[0m [31mtrue[0m;
    defaultEditor [1m[30m=[0m [31mtrue[0m;
    viAlias [1m[30m=[0m [31mtrue[0m;
    vimAlias [1m[30m=[0m [31mtrue[0m;
    configure [1m[30m=[0m {
      packages[1m[30m.[0mmyVimPackage [1m[30m=[0m [1m[1m[35mwith[0m pkgs[1m[30m.[0mvimPlugins; {
        start [1m[30m=[0m [ vim-nix ];
      };
    };
  };

  [3m[32m# Some programs need SUID wrappers, can be configured further or are[0m
  [3m[32m# started in user sessions.[0m
  [3m[32m# programs.mtr.enable = true;[0m
  [3m[32m# programs.gnupg.agent = {[0m
  [3m[32m#   enable = true;[0m
  [3m[32m#   enableSSHSupport = true;[0m
  [3m[32m# };[0m

  [3m[32m# List services that you want to enable:[0m

  [3m[32m# Enable the OpenSSH daemon.[0m
  services[1m[30m.[0mopenssh [1m[30m=[0m {
     enable [1m[30m=[0m [31mtrue[0m;
     [3m[32m# require public key authentication for better security[0m
     settings[1m[30m.[0mPasswordAuthentication [1m[30m=[0m [31mfalse[0m;
     settings[1m[30m.[0mKbdInteractiveAuthentication [1m[30m=[0m [31mfalse[0m;
     [3m[32m#settings.PermitRootLogin = "yes";[0m
};


  [3m[32m# Open ports in the firewall.[0m
  [3m[32m# networking.firewall.allowedTCPPorts = [ ... ];[0m
  [3m[32m# networking.firewall.allowedUDPPorts = [ ... ];[0m
  [3m[32m# Or disable the firewall altogether.[0m
  [3m[32m# networking.firewall.enable = false;[0m

  [3m[32m# This value determines the NixOS release from which the default[0m
  [3m[32m# settings for stateful data, like file locations and database versions[0m
  [3m[32m# on your system were taken. It‘s perfectly fine and recommended to leave[0m
  [3m[32m# this value at the release version of the first install of this system.[0m
  [3m[32m# Before changing this value read the documentation for this option[0m
  [3m[32m# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).[0m
  system[1m[30m.[0mstateVersion [1m[30m=[0m [1m[30m"unstable"[0m; [3m[32m# Did you read the comment?[0m

  [3m[32m#KDE polkit for hyprland[0m
  systemd [1m[30m=[0m {
  user[1m[30m.[0mservices[1m[30m.[0mpolkit-kde-agent [1m[30m=[0m {
    description [1m[30m=[0m [1m[30m"kde polkit"[0m;
    wantedBy [1m[30m=[0m [ [1m[30m"graphical-session.target"[0m ];
    wants [1m[30m=[0m [ [1m[30m"graphical-session.target"[0m ];
    after [1m[30m=[0m [ [1m[30m"graphical-session.target"[0m ];
    serviceConfig [1m[30m=[0m {
        Type [1m[30m=[0m [1m[30m"simple"[0m;
        ExecStart [1m[30m=[0m [1m[30m"[0m[1m[33m${[0mpkgs[1m[30m.[0mpolkit-kde-agent[1m[33m}[0m[1m[30m/libexec/polkit-kde-authentication-agent-1"[0m;
        Restart [1m[30m=[0m [1m[30m"on-failure"[0m;
        RestartSec [1m[30m=[0m [1m[30m1[0m;
        TimeoutStopSec [1m[30m=[0m [1m[30m10[0m;
      };
  };
};


}

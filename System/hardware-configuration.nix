{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.consoleLogLevel = 0;
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=log" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/9731c052-6851-4460-a678-4605cd211f70";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5BC9-5E1D";
      fsType = "vfat";
    };

  fileSystems."/home/daru/Anime" = 
  {
    device = "/dev/disk/by-label/FileSystemC";
    fsType = "exfat";
  };



  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0f1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  swapDevices = [  
    {
      device = "/var/lib/swapfile";
      size = 3072;
      # swappiness = 7;
    }
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

#  services.udev.extraRules = ''
#   ACTION=="change", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness"
#   ACTION=="change", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
#   ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"#
#       '';
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}

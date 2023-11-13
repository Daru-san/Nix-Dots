{pkgs, ...}:{
    #Set up swayidle
    services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 400; command = "${pkgs.swaylock}/bin/swaylock -fF";}
      { timeout = 1200; command = "systemctl suspend"; }
    ];
    systemdTarget = "xdg-desktop-portal-hyprland.service";
  };
}

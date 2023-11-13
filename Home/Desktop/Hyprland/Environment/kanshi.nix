{pkgs, ...}:{
  services.kanshi = {
    enable = true;
    systemdTarget = "xdg-desktop-portal-hyprland.service";
    profiles = {

      #Profile for when laptop is not connected to monitor
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
          }
        ];
      };

      #kanshi setup for monitor
      desktop = {
        outputs = [
        {
          criteria = "Samsung Electric Company SyncMaster HVJZB0065";
          mode = "1920x1080@72";
          position = "0,0";
          scale = 1.0;
        }
        {
          criteria = "eDP-1";
          status = "disable";
        }
        ];
      };
    };
  };
}

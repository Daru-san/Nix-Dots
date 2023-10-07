{config, pkgs, ...}:{
    services.swayosd.enable = true;
    wayland.windowManager.sway = {
     package = pkgs.swayfx;
     enable = true;

     config = rec {
        bars = [];
        menu = "rofi -show drun";
       # fonts = ["JetbrainsMono Nerd Font 14"];
       gaps = 
         {
           inner = 7;
           outer = 8;
           smartGaps = false;
           smartBorders = "on";
         };
        input = {
         "1267:12384:ELAN0501:00_04F3:3060_Touchpad" = {
           tap = "enabled";
           natural_scroll = "enabled";
         };
        };
        output = {
           HDMI-A-1 = {
            # mode = "1920x1060@60";
            };
             eDP-1 = {
             # enable = false;
             #mode = "off";
             };
           };
       window = 
          {
         border = 1;
         titlebar = false;
         }
        ;
       modifier = "Mod4";
       # Use kitty as default terminal
       terminal = "kitty"; 
        startup = [
         {command = "kitty";}
         {command = "swaymsg output eDP-1 disable";}
         {command = "swww init";}
      ];

      };
      extraConfig = "
        blur enable
       blur_xray disable
       blur_passes 1 
       blur_radius 1
        corner_radius 6 
       shadows enable
       default_dim_inactive 0.18
      ";
  };
}

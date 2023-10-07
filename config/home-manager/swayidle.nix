{ config, pkgs, lib, ... }:

{
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    timeouts = [
      {
        timeout = 300;
        command = ''notify-send -t 10000 -- "Screen lock in 30 seconds"'';
      }
      {
        timeout = 330;
        command = "swaylock -fF";
      }
      {
        timeout = 300;
        command = ''swaymsg "output * dpms off"'';
        resumeCommand = ''swaymsg "output * dpms on"'';
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "swaylock -fF";
      }
      {
        event = "lock";
        command = "swaylock -fF";
      }
    ];
  };
}

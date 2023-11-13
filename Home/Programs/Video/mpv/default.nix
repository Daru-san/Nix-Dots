#mpv configuration
{config, pkgs, ...}:{
  programs.mpv = {
    enable = true;
    bindings = {
    };

    #mpv configs
    config = {

      #Enable hardware-acceleration
      hwdec = "auto-safe";
    };

    #mpv scripts
    scripts = with pkgs.mpvScripts; [
      sponsorblock
      convert
      uosc
      youtube-quality
      mpris
      autocrop
      thumbfast
    ];
  };
}

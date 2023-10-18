{config, ...}:{
    wayland.windowManager.hyprland = {
      settings = {

        windowrulev2 = [
          #Task manager-like window for system monitoring 
          "workspace special,class:(kitty),title:(Performance)"
          "center 1,class:(kitty),title:(Performance)"
          "workspace special,class:(mission-center)"

          "workspace F5,class:(kitty),title:(Anime)"
          "workspace F6,class:(kitty),title:(Music)"

          "workspace, F11,class:(kitty),title:(Files)"
          "workspace F12,class:(cool-retro-term),title:(Clock)"
          "fullscreen,class:(cool-retro-term),title:(Clock)"
  
        ];
        windowrule = [
          "workspace F1,class:^(firefox)"
          "workspace F2,class:^(obisidian)"
          "workspace F3,class:^(libreoffice)"
          "workspace F4,class:^(org.gnome.Nautilus)"
          "workspace F8,class:^(Spotify)"
          "workspace F7,class:^(FreeTube)"

          "workspace F9,class:^(io.gitlab.news_flash.NewsFlash)"
          "workspace F10,class:^(evince)"
        ];
        workspace = [
          "1, persistent:true"
          "name:F1, default:true, persistent:true"
          "name:F9, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F10, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F11, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
          "name:F12, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        ];
      };
    };
  }
##workspace guidelines
#1-9 anything(mostly terminals)
#F1-F4 Productivity i.e obisidian, libreoffice, firefox
#F5-F8 Media i.e ani-cli, freetube, cmus, spotify
#F9-F12 Anything else i.e clock screensaver, newsflash, evince

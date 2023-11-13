#Configuration and declaring of most of the cli programs
{config, pkgs, ...}:{
    imports = [
      #Programs that have specialized modules
      ./ranger/ranger.nix
      ./btop/btop.nix 
      ./neofetch/neofetch.nix
      ./yt-dlp/yt-dlp.nix
      ./ani-cli/ani-cli.nix
    ];
    home.packages = with pkgs; [
      hello #Hi there
      tree #tree
      figlet #
      bc #Calculator
      transmission #Cli torrent client
      tty-clock #In-terminal clock 
      libnotify #Notifications
      cbonsai #Trees ;)
      ddgr #Searching in the terminal
      losslesscut-bin #Editing videos
      speedtest-cli #Internet speed test
      lynx #Terminal browser
      w3m #Also a terminal browser and terminal image viewer
      chroma #For cat coloring
      glow #Markdown editor
      gping #Ping with graphics
      nvtop-intel #Gpu top
      sysz #Systemd service search
     # wtf
      nap #Code snippets
      jrnl #Journal 
      chafa 
      calcure  
      browsh
      translate-shell
      tmux
      krabby
      yafetch
    ];
  }

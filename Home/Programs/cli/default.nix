{config, pkgs, ...}:{
    imports = [
      ./ranger/ranger.nix
      ./neovim/nvim.nix
      ./btop/btop.nix 
      ./neofetch/neofetch.nix
      ./yt-dlp/yt-dlp.nix
      ./git/git.nix
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
      chroma
      glow
      gping
      nvtop-intel
      sysz
      wtf
      nap
      jrnl
      chafa
      calcure
      lf 
      browsh
      translate-shell
      tmux
    ];
  }

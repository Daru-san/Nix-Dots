##Global shell configuration##
{config, pkgs, ...}:{
  imports = [
  #Import bash and zsh configs
  ./zsh/zsh.nix
  ./bash/bash.nix 
  ];

  #Global shell aliases
  home.shellAliases = {
    g = "git";
    ll = "ls -l";
    ex = "exit";
    cat = "ccat";    
    logout = "loginctl terminate-user $USER";
    nofetch = "neofetch --config none"; 
    O_O = "echo Hi!";
    clock = "tty-clock -b -s -c -B -r -n -S";
    nv = "nvim";
    rsync-copy = "rsync -avzhe --progress";
    rsync-move = "rsync --remove-source-files -zvh --progress";
    nix-rebuild = "sudo nixos-rebuild switch";
    nix-edit = "sudoedit /etc/nixos/configuration.nix";
    nix-editHW = "sudoedit /etc/nixos/hardware-configuration.nix";
    rs = "reset";
    cl = "clear";
    anifetch = "neofetch --config ~/.config/neofetch/anifetch.conf";
    img = "kitten icat --hold";
    r = "ranger";
    home-flake = "home-manager switch --flake ~/Nix-Dots --impure";
    nix-upgrade = "sudo nixos-rebuild switch --upgrade-all";
    nix-upgrade-full = "sudo nixos-rebuild switch --upgrade-all && home-flake";
    cdots = "cd ~/Nix-Dots/";
    cdownl = "cd ~/Downloads/";
    cdocs = "cd ~/Documents/";
    cwalls = "cd ~/Wallpapers/";
    ani = "ani-cli --rofi --vlc";
    anidu = "ani-cli  --rofi --vlc --dub";
    anid = "ani-cli -d";
    anidud = "ani-cli --dub -d";
    rebootf = "sudo systemctl reboot -f";
  };
}

##Global shell configuration##
{config, pkgs, ...}:{
  imports = [ 
  ./zsh/zsh.nix
  ./bash/bash.nix 
  ];

  #Global shell aliases
  home.shellAliases = {
    g = "git";
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
    home-switch = "home-manager switch";
    nvhome = "nvim ~/.config/home-manager/home.nix";
    ex = "exit";
    cat = "ccat";    
    logout = "loginctl terminate-user $USER";
    nofetch = "neofetch --config none"; 
    O_O = "echo Hi!";
    clock = "tty-clock -b -s -c -B -r -n -S";
    nv = "nvim";
    rsync-copy = "rsync -avzhe --progress";
    rsync-move = "rsync --remove-source-files -zvh --progress";
    nixos-rebuild = "sudo nixos-rebuild switch";
    nixos-edit = "sudoedit /etc/nixos/configuration.nix";
    nixos-editHW = "sudoedit /etc/nixos/hardware-configuration.nix";
    rs = "reset";
    cl = "clear";
    anifetch = "neofetch --config ~/.config/neofetch/anifetch.conf";
    img = "kitten icat --hold";
    r = "ranger";
    home-flake = "home-manager switch --flake ~/Nix-Dots/flake.nix --impure";
  };
}

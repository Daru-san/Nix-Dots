{config, pkgs, ...}: {
    programs.zsh = {
      enable = true;
      shellAliases = {
       ll = "ls -l";
       update = "sudo nixos-rebuild switch";
       homeswitch = "home-manager switch";
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
      j = "jump";
      img = "kitten icat --hold";
      # config = "git --git-dir=~NixNiNix-Dots/.git --work-tree=~/Nix-Dots/"
  };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    }; # Your zsh config
   oh-my-zsh = {
      enable = true;
     plugins = [ "git" "sudo" "colorize" "catimg" "jump" "extract"];
     theme = "muse";
    };
   plugins = [
      {
       # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.4.0";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "v0.8.0";
            sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
          };
      }
    {
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "23.05.24";
          sha256 = "174yvfphdiaqvwxwmb6ja260nvbbjh44ifav9w39vrh1ghh7m9gz";
        };
      }
    ];
  };
}

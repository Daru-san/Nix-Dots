{config,pkgs,...}:{
  programs.git = {
    enable = true;
    userName = "0LaMica";
    userEmail = "mica.tui@proton.me";   
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
      a = "add";
      p = "push";
      pu = "pull";
    };
  };
  home.packages = with pkgs; [
    gitui
  ];
}

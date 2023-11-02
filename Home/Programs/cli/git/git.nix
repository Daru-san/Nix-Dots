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
    };
  };
  home.packages = with pkgs; [
    gitui
  ];
}

{config,pkgs,...}:{
  home.packages = with pkgs; []
    neofetch
  ];
  home.file.".config/neofetch" = "config/neofetch";
}

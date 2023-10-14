{config, pkgs, ...}:{
    gtk = {
      enable = true;
      theme = {
          name = "Adwaita-dark";
          # package = pkgs.fluent-gtk-theme;
        };
      iconTheme = {
          name = "ePapirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
    };
    home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}
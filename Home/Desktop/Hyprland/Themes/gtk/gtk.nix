{config, pkgs, ...}:{
  gtk = {
     enable = true;
     theme = {
        name = "Fluent-Dark";
        package = pkgs.fluent-gtk-theme;
    };
    iconTheme = {
          name = "ePapirus-Dark";
          package = pkgs.papirus-icon-theme;
    };
   };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
         color-scheme = "prefer-dark";
      };
    };
    home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}

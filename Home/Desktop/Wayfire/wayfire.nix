{config, pkgs, ...}:{ 
  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wcm
      wf-shell
      wayfire-plugins-extra
    ];
  };
  home.file.".config/wayfire.ini".source = config.lib.file.mkOutOfStoreSymlink ./wayfire.ini;
}

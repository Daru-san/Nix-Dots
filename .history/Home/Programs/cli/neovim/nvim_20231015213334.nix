{config, pkgs, lib, ...}:{
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
  };
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./config;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

{config, pkgs, ...}:{
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
  };
  home.file.".config/nvim".source = "config";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

{config, pkgs, lib, ...}:{
  home.file.".config/ranger".source = config.lib.file.mkOutOfStoreSymlink ./config;
}

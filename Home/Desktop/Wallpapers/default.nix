{config, pkgs, ...}:{
  
 home.file."Wallpapers" = {
    # don't make the directory read only so that impure melpa can still happen
    # for now
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "D3Ext";
      repo = "aesthetic-wallpapers";
      rev = "9925e5c764e68ddaaecff6afb0991d80939ec1f9";
      sha256 = "u6QzTa5VScOZHbO/5WRORjbuQoCA5C774f1z1TTH87k=";
    };
  };
}

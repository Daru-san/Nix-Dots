{pkgs, ...}:{
  programs.translate-shell = {
    enable = true;
    hl = "en";
    view = true;
    verbose = true;
    tl = [
      "jp"
      "af"
    ];
  };
}

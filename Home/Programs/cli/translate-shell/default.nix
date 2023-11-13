{pkgs, ...}:{
  programs.translate-shell = {
    enable = true;
    hl = "en";
    view = true;
    engine = "bing";
    tl = [
      "jp"
      "af"
    ];
  };
}

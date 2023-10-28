{config,pkgs,...}:{
  programs.minecraft = {
    shared = {
      username = "NixDude";
    };
    versions = {
      "vanilla18" = {
        minecraft.version = "1.18";
      };
      "projectozone3" = {
        modpack.curseforge = {
          projectId = 256289;
          fileId = 3590506;
          hash = "sha256-sm1JihpKd8OeW5t8E4+/wCgAnD8/HpDCLS+CvdcNmqY=";
        };
        forge.hash = "sha256-5lQKotcSIgRyb5+MZIEE1U/27rSvwy8Wmb4yCagvsbs=";
      };
    };
  };
}
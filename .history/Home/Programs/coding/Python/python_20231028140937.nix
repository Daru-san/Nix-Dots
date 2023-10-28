{config,pkgs,...}:{
  home.packages = with pkgs; [
       (python311.withPackages(ps: with ps; [ pygments setuptools pygit2 sh aioshutil pip]))
  ];
  }

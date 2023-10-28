{config,pkgs,...}:{
  home.packages = with pkgs; [
       (python311.withPackages(ps: with ps; [ 
         pygments
    #     pathlib 
    #     configargparse 
    #     setuptools 
    #     pygit2 
    #     sh 
    #     aioshutil 
        pip]))
  ];
}

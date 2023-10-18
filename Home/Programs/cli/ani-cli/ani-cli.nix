{config, pkgs, ...}:
{ 
  home.packages = with pkgs; [
    ani-cli
    
    #Dependancies
    mpv
    vlc
    syncplay

  #Ani-cli script (ani-cli already has it's own interface, I'm just making it a bit easier to use) 
    (pkgs.writeShellScriptBin "ani-watch" ''
        read -p "Enter anime name: " anime
        read -p "Enter episode number(or range): " ep 
        read -p "dub or sub: " sb 
        read -p "Quality(e.g 720p): " qt
        read -p "Download the episode(s)(y/n):" d 
        sleep 1
        if [[d = "y"]]; 
          then 
           exec ani-cli $anime -d --rofi --$sb ---q $qt -e $ep
          else
           exec ani-cli $anime --rofi --$sb --q $qt -e $ep
         fi   
      '')
  ];
}

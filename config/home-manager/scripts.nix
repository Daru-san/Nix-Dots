{config, pkgs, ...}:{
    home.packages = with pkgs; [
      (pkgs.writeShellScriptBin "my-hello" ''
       echo "Hello, ${config.home.username}!"
     '')
      (pkgs.writeShellScriptBin "adb-wifi"''
        adb tcpip 5555
        ip = $(adb shell ip -f inet addr show wlan0)
        adb connect $ip 
       '')
      (pkgs.writeShellScriptBin "jScript" ''
        java ~/code/java/main.java
      '')
      (pkgs.writeShellScriptBin "anime" ''
        read -p "Enter anime name: " anime
        read -p "Enter episode number(or range): " ep 
        read -p "dub or sub: " sb 
        echo "You can add --download to download the episode(s)"
        sleep 4
        ani-cli $anime --$sb -e $ep 
      '')
    ];
  }

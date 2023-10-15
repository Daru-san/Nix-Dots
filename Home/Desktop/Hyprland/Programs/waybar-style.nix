{config, pkgs, lib, ...}:{

  programs.waybar.style = ''
  @import "waybar-theme.css";
* {
   
    font-family: JetBrainsMono Nerd Font;
    font-size: 18px;
}

/*
* {
   
    font-family: Maple Mono NF;
    font-size: 18px;
}
*/

window#waybar {
    background-color: @dark1;
    transition-property: background-color;
    transition-duration: .5s;

}

window#waybar.hidden {
    opacity: 0.2;
}


window#waybar.termite {
    background-color: #e5e9f0;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 0px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    /*replace this; sway workspaces button*/
}

#workspaces button {
    background-color: transparent;
    color: @green;
    padding-left: 4px;
    padding-right: 7px;


    
}

#workspaces button:hover {
    background: @light1;
    border-radius: 2rem 2rem 2rem 2rem;    
    color: @dark1;
    text-shadow: none;


}

#workspaces button.focused {
    background-color: @light2;
    border-radius: 2rem 2rem 2rem 2rem;
    color: @dark1;
    


}

#workspaces button.urgent {
    background-color: @red;

}



#workspaces {
    border-radius: 2rem 2rem 2rem 2rem;
    margin-top: 4px;
    margin-bottom: 4px;
    margin-left: 3px;
    margin-right: 3px;
    background-color: @dark3;

}

#mode {
    background-color: @dark1;
}
#window {
    background-color: @dark1 ;
    color: @text2;
    font-size: 20px;


}


#custom-notification,
#battery,
#custom-updates,
#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#bluetooth,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#mpd {
    padding: 0 11px;
    margin-top: 4px;
    color: @teal;
    margin-bottom: 4px;
    background-color: @dark3;
    /*border-radius: 2rem 2rem 2rem 2rem;*/
}

#custom-notification {
    border-radius: 2rem 2rem 2rem 2rem;
}

#pulseaudio,
#clock{
    color: @sapphire;
    border-radius: 2rem 2rem 2rem 2rem;
    margin-right:3px;
    margin-left:3px;
/*    background-color: @light2;*/
}
 #cpu {
    margin-left:0px;
  /*  color: @text2;*/
    border-radius: 0 0 0 0;
} 

#bluetooth,
#memory {
   /* color: @text2;*/
    margin-right:3px;
    border-radius: 0 2rem 2rem 0;
}

#disk {
    color: @dark4;
    margin-right:3px;
    border-radius: 0 2rem 2rem 0;
    background-color: @light2;
}

#network,
#battery {
 /*   color: @text2;*/
    border-radius: 2rem 0 0 2rem;
    margin-left:3px;
    margin-right:0px;
}
#network,
#tray,
#custom-notification,
#bluetooth {
  background-color: @deep-blue;
  color: @sky;
}
#memory,
#cpu,
#battery {
/* background-color: @dark-blue;*/
 color: @sapphire;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}


label:focus {
    background-color: #000000;
}


#pulseaudio.muted {
    
    color: @red;
}

#wireplumber {
 
    color: #000000;
}

#wireplumber.muted {
    
}


#temperature {
 color: white;
}

#temperature.critical ~ #cpu {
    color: red;
}

#tray {
  border-radius: 2rem 2rem 2rem 2rem;
  margin-right:3px;
  margin-left:3px;  
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
   
}


#language {
    background-color: @dark1;
    color: @text2;
    padding: 1 3px;
    margin: 1 3px;
    min-width: 17px;

}



#keyboard-state {
    background: @dark2; 
    color: @dark2;
    padding: 1 3px;
    margin: 1 3px;
    min-width: 17px;

} 

#keyboard-state > label.locked {
    background: @dark2; 
    color: @text3;
    padding: 1 3px;
    margin: 1 3px;
    min-width: 17px;

}       

#scratchpad {
    background: @dark1;
    color: @text2;
}

#scratchpad.empty {
	background-color: transparent;
}

    '';
}

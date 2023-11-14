Nix-Dots
===========

My NixOS configuration featuring flakes and Hyprland

<p align="center"><img src="https://i.imgur.com/X5zKxvp.png" width=300px></p>
<p align="center">
    <img src="https://img.shields.io/static/v1?label=Hyprland&message=Stable&style=flat&logo=hyprland&colorA=24273A&colorB=8AADF4&logoColor=CAD3F5"/>
    <img src="https://img.shields.io/static/v1?label=Nix Flake&message=Check&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5"
</p>
    
#### My personal NixOS, home manager config using flakes and Hyprland ####

    
## Main programs ##

* Desktop: Hyprland
* Browser: Firefox-nightly
* Launcher: rofi _wayland_
* Bar: waybar
* Terminal: kitty
* Shell: zsh - _Oh-my-zsh_
* Music: Spotify - _Spicetify_
* Editor: Neovim - _NvChad_
* System monitor: Btop++
* Audio effects: EasyEffects
* File manager: Nautilus/Ranger

## Note ##
* This repo is archived, the new repo is ![SnowflakeOS](https://github.com/Daru-san/SnowflakeOS)
* This repo has been archived since I've created a new repo that remakes everything from scratch, this repo is no longer needed
* This is a home configuration, not a system one. I do not manage home-manager with configuration.nix
* This configuration is relatively easy to copy for yourself but will need some editing to get it working properly, all paths are relative to the username
* Use these configs if you're brave enough

Screenshots
-----------
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview.png "Example with terminal")
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview2.png "Neovim with NvChad")
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview3.png "Neovim")
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview4.png "Rofi drun")
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview5.png "'Task manager'")
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview6.png "Power menu")
![picture alt](https://github.com/0LaMica/Nix-Dots/blob/main/assets/preview7.png "My goat on Linux")

<hr>




TODO
------

This is a small roadmap of where these configs are going

### Todo

- [ ] Implement theme switching
- [ ] Set up eww widgets
- [ ] Add custom shells for specific languages
- [ ] Add custom pkgs for mangayomi and whatsie
- [ ] Create deploy script
- [ ] Add system flake
- [ ] Add global variables and configs


### In Progress

- [ ] Finish Neovim config with kickstarter.nvim
    - [x] Add the repo to config
    - [ ] Move from NvChad to kickstarter  
- [ ] Complete wallpaper config with global variables
    - [x] Add repo
    - [x] Update wallpaper script _wall-script_
    - [ ] Add set wallpaper as a global config variable 
- [ ] Finish documentation   
- [ ] Redo rofi config
   - [x] Set up custom shell scripts
   - [ ] Set up custom themes

### Done ✓

- [x] Complete firefoxone config
- [x] Complete ranger plugins
- [x] Set up spicetify  
- [x] Set up Minecraft

{config, pkgs, ...}: {
  imports = [
    ./kitty-tab-bar.nix #Import custom tab bar for kitty
  ];
  programs.kitty = {
    enable = true;
    theme = "Xcodedark";
    font = {
      name = "Roboto Mono Nerd Font";
      size = 12;
    };
    settings = {
      tab_bar_edge = "top";
      tab_bar_style = "custom";
      #tab_powerline_style = "round";
      tab_activity_symbol = "◉";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "italics";
      input_delay = 1;
      repaint_delay = 7;
      window_margin_width = 8;
      window_margin_height = 6;
      term = "kitty";
      placement_strategy ="center";

      hide_window_decorations = false;
      background_opacity = 0;
      sync_to_monitor = true;
      mouse_hide_wait = 20;
      cursor_shape = "beam";
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 15;
      scrollback_lines = 100000;
      scrollback_pager = "kitty-scroll";
    };
  };

#Script for scrollback pager
  home.packages = with pkgs; [
        (pkgs.writeShellScriptBin "kitty-scroll" ''
         nvim --noplugin -c "set signcolumn=no showtabline=0" -c "silent! write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "
     '')
  ];
  home.file.".config/kitty/SystemMonitor.conf".text = ''
    new_tab SystemMonitor
    title Btop
    launch btop

    new_tab Graphics
    title NvTop
    launch nvtop
  '';
}

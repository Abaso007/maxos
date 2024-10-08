{ config, lib, pkgs, ... }:

{
  xresources.properties = {
    "urxvt.scrollBar" = "false";
    "urxvt.font" = "xft:MesloLGS Nerd Font Mono:pixelsize=22";
    "urxvt.perl-ext-common" = "default,matcher";
    "urxvt.url-launcher" = "/run/current-system/sw/bin/xdg-open";
    "urxvt.matcher.button" = "1";

    "*background" = "#101010";
    "*foreground" = "#66FF66";
    "*cursorColor" = "#66ff66";
    # black
    "*color0" = "#1c1c1c";
    "*color8" = "#4d4d4d";
    # red
    "*color1" = "#D81860";
    "*color9" = "#F00060";
    # green
    "*color2" = "#60FF60";
    "*color10" = "#70FF70";
    # yellow
    "*color3" = "#f9fd75";
    "*color11" = "#f9fd80";
    # blue
    "*color4" = "#4695c8";
    "*color12" = "#5a9dc8";
    # magenta
    "*color5" = "#a78edb";
    "*color13" = "#b29fdb";
    # cyan
    "*color6" = "#43afce";
    "*color14" = "#69b8ce";
    # white
    "*color7" = "#f3ebe2";
    "*color15" = "#eeeeee";
  };
}

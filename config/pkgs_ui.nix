{ config, pkgs, lib, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    audacity                                                                                             # Sound editor with graphical UI
    copyq                                                                                                # Clipboard Manager with Advanced Features
    gsettings-desktop-schemas                                                                            # Collection of GSettings schemas for settings shared by various components of a desktop
    i3                                                                                                   # A tiling window manager
    i3status-rust                                                                                        #
    libnotify                                                                                            # A library that sends desktop notifications to a notification daemon
    lxappearance                                                                                         # Lightweight program for configuring the theme and fonts of gtk applications
    networkmanager_dmenu                                                                                 #
    notify-desktop                                                                                       # Little application that lets you send desktop notifications with one command
    redshift                                                                                             # Screen color temperature manager
    tesseract                                                                                            # OCR engine
    x11docker                                                                                            # Run graphical applications with Docker
    x11vnc                                                                                               # A VNC server connected to a real X11 screen
    xclip                                                                                                # Tool to access the X clipboard from a console application
    xlockmore                                                                                            # Screen locker for the X Window System
    xorg.libXext                                                                                         #
    xorg.xbacklight                                                                                      #
    xorg.xeyes                                                                                           #
    xorg.xhost                                                                                           #
    xorg.xmodmap                                                                                         #
    xwayland                                                                                             #
    yank                                                                                                 # Yank terminal output to clipboard
  ];
}

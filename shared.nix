# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  boot.kernelParams = [ "intel_pstate=active" ];
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.useOSProber = true;
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only
  boot.loader.grub.extraEntries = ''
    menuentry "Reboot" {
      reboot
    }
    menuentry "Poweroff" {
      halt
    }
  '';

  # Set your time zone.
  time.timeZone = "Europe/London";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "video" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    hashedPassword = "!";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     acpi
     apktool
     android-studio
     #android-tools
     appimage-run
     asciinema
     atom
     awscli
     azure-cli
     brightnessctl
     brillo
     #btop
     burpsuite
     calibre
     chroma
     chromium
     cifs-utils
     clamav
     connman
     connman-gtk
     coreutils
     cutter
     cups-brother-hl3140cw
     dbeaver
     dex2jar
     dhcpcd
     #dig
     dmenu
     docker
     docker-compose
     dunst
     electrum
     enum4linux
     #evolution
     fcrackzip
     feh
     ffmpeg
     file
     filezilla
     firecracker
     firectl
     firefox
     flameshot
     fswebcam
     fzf
     gcc
     genymotion
     gimp
     git
     #gitleaks
     git-crypt
     glances
     #gnome.gnome-keyring
     gnupg
     go
     gobuster
     googler
     grc
     grim
     gsettings-desktop-schemas
     hexedit
     #home-manager
     hping
     htop
     i3
     i3status-rust
     imagemagick
     inetutils
     inkscape
     ipcalc
     iwd
     jdk
     jd-gui
     john
     jq
     jython
     k3s
     keepassxc
     kompose
     kubectl
     kubernetes-helm
     kustomize
     libreoffice-fresh
     libsecret
     lshw
     lynis
     mako
     mosh
     mplayer
     mpv
     mtr
     navi
     nethogs
     networkmanager
     ngrep
     ngrok
     nixos-generators
     nmap
     notify-desktop
     ntfs3g
     #nvidia-docker
     obsidian
     openconnect
     #opensnitch
     #opensnitch-ui
     openssh
     openssl
     openttd
     openvpn
     p7zip
     pandoc
     pass
     pavucontrol
     pciutils
     pdfgrep
     pinentry
     peco
     protonmail-bridge
     pwgen
     python310
     qemu
     qemu-utils
     radare2
     rdesktop
     redshift
     remmina
     rsync
     ruby
     rxvt-unicode
     screen
     scrot
     sddm
     signal-desktop
     slack
     sqlite-web
     sqlmap
     sshfs
     #steam
     stockfish
     #sway
     syncthing
     terraform
     testssl
     thc-hydra
     thefuck
     tig
     tmux
     trufflehog
     tor
     #tor-browser-bundle-bin
     twmn
     unrar
     unzip
     velero
     vim
     vlc
     vue
     w3m
     #wafw00f
     #wapiti
     waybar
     wayvnc
     wget
     whois
     wireguard-tools
     wireshark-qt
     woeusb
     wpscan
     x11docker
     x11vnc
     xlockmore
     #xmind
     xorg.xbacklight
     xorg.xeyes
     xorg.xmodmap
     xwayland
     youtube-dl
     zip
     zlib
     zoom-us
     zotero
     zsh
     zsh-autosuggestions
     zsh-completions
     zsh-powerlevel10k
     zsh-syntax-highlighting
     #zsh-z
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
  };

  # Steam
  #programs.steam.enable = true;
  # Sway
  #programs.sway.enable = true;

  # List services that you want to enable:
  # Enable zsh
  programs.zsh.enable = true;

  # Firefox policy for extensions
  environment.etc."firefox/policies/policies.json".source = ./common/firefox/firefox-policies.json;

  # Laptop light
  programs.light.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";

  security.sudo.wheelNeedsPassword = false;

  # Flakes
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # For WireGuard
  networking.firewall.checkReversePath = false;

  # X11 / i3
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "user";
    };
      
    # Touchpad
    synaptics = {
      enable = true;
      vertTwoFingerScroll = true;
      palmDetect = true;
      minSpeed = "1.5";
    };
  };

  ## Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  ## Timesync
  services.timesyncd.enable = true;

  # k3s and other services
  networking.firewall.allowedTCPPorts = [ 22 80 443 8080 8081 8082 8083 8084 8085 6443 ];

  # k3s
  services.k3s.enable = false;
  services.k3s.role = "server";

  ## Ignore lid on laptops
  services.logind.lidSwitch = "ignore";

  ## syncthing
  #services.syncthing.enable = true;
  #services.syncthing.user = "user";
  #services.syncthing.dataDir = "/home/user/syncthing";
  #services.syncthing.configDir = "/home/user/.config/syncthing";

  ## For Obsidian
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];

  ## docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    liveRestore = false;
  };

  ## VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user" ];

  # opensnitch
  #services.opensnitch.enable = false;

  ## fonts
  fonts.fonts = with pkgs; [
    nerdfonts
    meslo-lgs-nf
  ];

  ## hosts file
  networking.extraHosts =
  ''
    127.0.0.1 appwrite.ds bibliogram.ds bookstack.ds botpress.ds calibre.ds chatwoot.ds commento.ds crater.ds cryptpad.ds directus.ds discourse.ds dolibarr.ds drawio.ds element.ds ethercalc.ds etherpad.ds ethibox.ds fathom.ds firefly.ds flarum.ds framadate.ds freshrss.ds ghost.ds gitlab.ds gogs.ds grafana.ds grav.ds habitica.ds hasura.ds hedgedoc.ds huginn.ds invoiceninja.ds jenkins.ds jitsi.ds kanboard.ds listmonk.ds magento.ds mailserver.ds mailtrain.ds mastodon.ds matomo.ds mattermost.ds matterwiki.ds mautic.ds mediawiki.ds metabase.ds minio.ds mobilizon.ds monitoring.ds n8n.ds nextcloud.ds nitter.ds nocodb.ds odoo.ds passbolt.ds peertube.ds phpbb.ds pinafore.ds pixelfed.ds plume.ds polr.ds portainer.ds posthog.ds prestashop.ds pydio.ds pytition.ds rainloop.ds redmine.ds registry.ds rocketchat.ds rsshub.ds scrumblr.ds searx.ds suitecrm.ds taiga.ds talk.ds traefik.ds umami.ds uptime-kuma.ds waiting.ds wallabag.ds wekan.ds whoogle-search.ds wikijs.ds wordpress.ds writefreely.ds zammad.ds
  '';

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

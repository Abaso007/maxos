{ config, pkgs, lib, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    distro
    pip
    requests
    setuptools
    wordcloud
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     abootimg
     acpi
     adreaper
     afflib
     afl
     aflplusplus
     aiodnsbrute
     aircrack-ng
     airgeddon
     amass
     androguard
     android-studio
     android-tools
     anevicon
     apkeep
     apkleaks
     apktool
     appimage-run
     arduino
     aria
     arping
     arp-scan
     asciinema
     atftp
     authoscope
     autokey
     awscli
     azure-cli
     badchars
     bandwhich
     bat
     bettercap
     bingrep
     binwalk
     boofuzz
     bore-cli
     brakeman
     brightnessctl
     brillo
     broot
     bruteforce-luks
     brutespray
     bully
     burpsuite
     cabextract
     calibre
     cameradar
     cantoolz
     cardpeek
     cargo-audit
     cariddi
     cassowary
     certipy
     cfripper
     chain-bench
     changetower
     checkip
     checkov
     checksec
     cherrytree
     chipsec
     chisel
     chkrootkit
     chntpw
     choose
     chopchop
     chroma
     chromium
     cht-sh
     cifs-utils
     clair
     clamav
     cliam
     cloudbrute
     cloudlist
     connman
     connman-gtk
     coreutils
     corkscrew
     corsair
     cowpatty
     credential-detector
     croc
     crowbar
     crunch
     cups-brother-hl3140cw
     #cutter
     dalfox
     dbeaver
     dcfldd
     ddosify
     ddrescue
     ddrescueview
     deepsea
     detect-secrets
     dex2jar
     dhcp
     dhcpcd
     dhcpdump
     dig
     dirb
     dislocker
     dismap
     dive
     dmenu
     dnsenum
     dnsrecon
     dnstake
     dnstop
     dnstracer
     dnstwist
     dnsx
     docker
     docker-compose
     dockle
     dog
     dontgo403
     doona
     dos2unix
     driftnet
     drill
     dsniff
     du-dust
     duf
     dunst
     electrum
     enum4linux
     enum4linux
     enum4linux-ng
     erosmb
     esptool
     ettercap
     evillimiter
     evil-winrm
     exiv2
     ext4magic
     extrude
     extundelete
     fcrackzip
     fd
     feh
     feroxbuster
     ffmpeg
     ffuf
     fierce
     file
     filezilla
     findomain
     firecracker
     firectl
     firefox
     flameshot
     flashrom
     foremost
     fping
     fswebcam
     fwanalyzer
     fzf
     galer
     gammastep
     gau
     gcc
     gef
     genymotion
     ghidra-bin
     ghost
     gimp
     git
     git-crypt
     gitleaks
     glances
     gnumake
     gnupg
     go
     go365
     gobuster
     gokart
     gomapenum
     googler
     goreplay
     gospider
     gotestwaf
     gotty
     gpa
     gping
     gqrx
     grc
     grim
     grype
     gsettings-desktop-schemas
     gzrt
     hachoir
     hakrawler
     hans
     hashcat
     hashcat
     hashcat-utils
     hashdeep
     hcxtools
     hdparm
     hexedit
     hey
     hey
     hivex
     honeytrap
     honggfuzz
     horst
     hping
     hping
     htop
     httpdump
     httptunnel
     httpx
     hyper
     i3
     i3status-rust
     ike-scan
     ike-scan
     imagemagick
     inetutils
     inkscape
     iodine
     iotop
     ipcalc
     ipcalc
     iperf2
     ipscan
     iwd
     jadx
     jaeles
     jaeles
     jd-gui
     jdk
     john
     john
     jq
     junkie
     jupyter
     jython
     k3s
     k6
     kalibrate-hackrf
     kalibrate-rtl
     kdigger
     keepassxc
     kerbrute
     kind
     kismet
     kiterunner
     kiwix
     knockpy
     kompose
     kubeaudit
     kubectl
     kubernetes-helm
     kubescape
     kube-score
     kustomize
     lazygit
     ldeep
     ldeep
     lftp
     libfreefare
     libnotify
     libreoffice-fresh
     libsecret
     lshw
     ltrace
     lynis
     lynis
     macchanger
     mako
     masscan
     mcfly
     mcrypt
     medusa
     metabigor
     mfcuk
     mfoc
     mitmproxy
     mongoaudit
     monsoon
     mosh
     mplayer
     mpv
     mtr
     mubeng
     multimon-ng
     naabu
     nasty
     navi
     nbtscanner
     ncftp
     ncrack
     neocomp
     netcat-gnu
     netdiscover
     nethogs
     netmask
     netsniff-ng
     net-snmp
     networkmanager
     networkmanager_dmenu
     nfs-utils
     ngrep
     ngrep
     ngrok
     nixops
     nixos-generators
     nload
     nmap
     nmap-formatter
     nodejs
     notify-desktop
     ntfs3g
     ntfs3g
     nth
     ntlmrecon
     ntopng
     nwipe
     obsidian
     onesixtyone
     openconnect
     openssh
     openssl
     openttd
     openvpn
     oshka
     ostinato
     OVMF
     p0f
     p7zip
     pandoc
     pass
     pavucontrol
     pciutils
     pdfgrep
     pdf-parser
     peco
     pev
     photon
     phrasendrescher
     pinentry
     pip-audit
     pixiewps
     protonmail-bridge
     proxify
     proxychains
     pstree
     putty
     pwgen
     pwnat
     pwndbg
     pwntools
     python310
     python-with-my-packages
     qemu
     qemu-utils
     qrcp
     qrencode
     radamsa
     radare2
     radare2
     ranger
     rdesktop
     reaverwps
     reaverwps-t6x
     recoverjpeg
     redfang
     redshift
     redsocks
     regexploit
     remmina
     ripgrep
     ripgrep-all
     rizin
     routersploit
     rshijack
     rsync
     rtorrent
     ruby
     rustcat
     rustscan
     rustscan
     rxvt-unicode
     safecopy
     safety-cli
     screen
     screenfetch
     scrot
     sddm
     secretscanner
     siege
     signal-desktop
     simg2img
     sipp
     sipsak
     sipvicious
     sish
     skjold
     slack
     sleuthkit
     slowlorust
     sn0int
     snallygaster
     sngrep
     sniffglue
     snmpcheck
     socat
     spike
     sqlite-web
     sqlmap
     srm
     ssb
     ssdeep
     ssh-audit
     sshchecker
     sshfs
     ssh-mitm
     sshping
     ssldump
     sslh
     sslsplit
     steampipe
     stegseek
     stockfish
     stunnel
     subfinder
     subfinder
     subjs
     subzerod
     swaggerhole
     swaks
     sx-go
     tcpflow
     tcpreplay
     teler
     terraform
     testdisk
     testssl
     texlive.combined.scheme-full
     tfsec
     thc-hydra
     thc-hydra
     thefuck
     tig
     tldr
     tmux
     tor
     tracee
     traitor
     trivy
     trivy
     truecrack
     trueseeing
     trufflehog
     tsung
     twmn
     ubertooth
     uddup
     udptunnel
     unrar
     unzip
     urlhunter
     usbutils
     utillinux
     valgrind
     vegeta
     velero
     vim
     virt-manager
     vlc
     vmware-horizon-client
     volatility3
     vue
     vulnix
     w3m
     wad
     wavemon
     waybar
     wayvnc
     wbox
     wget
     whispers
     whois
     wifite2
     win-virtio
     wipe
     wireguard-tools
     wireshark-qt
     witness
     woeusb
     wprecon
     wpscan
     wpscan
     wstunnel
     wuzz
     wuzz
     x11docker
     x11vnc
     xcalib
     xh
     xidel
     xkb-switch-i3
     xlockmore
     xorex
     xorg.xbacklight
     xorg.xeyes
     xorg.xmodmap
     xortool
     xwayland
     yara
     yersinia
     youtube-dl
     zap
     zeek
     zip
     zkar
     zlib
     zmap
     zoom-us
     zotero
     zsh
     zsh-autosuggestions
     zsh-completions
     zsh-powerlevel10k
     zsh-syntax-highlighting
     zzuf
  ];
}

{ config, pkgs, lib, ... }: {
  services.dhcpd4 = {
    enable = true;
    interfaces = [ "enp39s0" ];
    extraConfig = ''
      option domain-name-servers 1.1.1.1;
      option subnet-mask 255.255.255.0;

      subnet 192.168.0.0 netmask 255.255.255.0 {
        option broadcast-address 192.168.0.255;
        option routers 192.168.0.1;
        interface enp39s0;
        range 192.168.0.20 192.168.0.200;
      }
    '';
  };
}

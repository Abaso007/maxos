{ config, pkgs, lib, ... }: {
  services.syncthing = {
    enable = true;

    folders = {
      "Phone" = {
        id = "phone";
        devices = [
          "blueboy"
          "nas"
          "rig"
          #"fold4"
          #"GM1920"
        ];
        path = "/home/user/Phone";
      };

      "Data" = {
        id = "data";
        devices = [
          "blueboy"
          "nas"
          "rig"
          #"fold4"
          #"GM1920"
        ];
        path = "/home/user/Data";
      };
    };

    devices = {
      "blueboy" = {
        #autoAcceptFolders = true;
        id = "3YBMQYS-46IZSTQ-HLIP3O2-E22P3GJ-OS2PFCY-GTINZAF-PMH6HTN-2GDV4Q3";
        introducer = false;
      };
      "nas" = {
        id = "DCL3E6N-GIZIFEM-Z4ADAKR-IY2WT5M-G4ADVCI-LANSWO5-VIVH4H4-JDF6WAI";
        introducer = true;
      };
      "rig" = {
        #autoAcceptFolders = true;
        id = "3CETFIS-4P5BTDB-TQRFO54-H6ECZH4-OLHU2LB-DTQFTVA-ZFMPYJH-7FVSRA6";
        introducer = false;
      };
      #"galaxy" = {
      #  autoAcceptFolders = true;
      #  id = "DPWLINN-X2GRAYG-2IYFOXT-CRWLY3L-BMRDJGT-KE5ELWF-M76VOXR-XFREWQG";
      #  introducer = false;
      #};
      #"fold4" = {
      #  id = "PLY3QVN-3NQYXXB-PJO6KJ3-3MJ3H6B-QVQKRWI-CNX6PNS-VDADBY2-2J4VFA5";
      #  introducer = false;
      #};
      #"GM1920" = {
      #  id = "UAULTZS-JD7M5HI-E2BDK34-KOVLIGV-JZO357W-I2GGN25-IKOFLB7-B5SGRQD";
      #  introducer = false;
      #};
    };

    dataDir = "/home/user/syncthing";
    extraOptions = {
      gui = {
        theme = "black";
        tls = true;
      };
    };
    user = "user";
  };
}

{ config, pkgs, ... }: {
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cups-brother-mfcl2750dw ];
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;

  # Enable scanner support
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ ];
  # Simple graphical scanning utility
  environment.systemPackages = [ pkgs.simple-scan ];

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Alexander_BW";
        description = "Alexander BW";
        location = "Alexander's Office";
        deviceUri = "lpd://192.168.10.174/binary_p1";
        model = "brother-MFCL2750DW-cups-en.ppd";
        ppdOptions = {
          PageSize = "A4";
          BrMediaType = "PLAIN";
          Resolution = "600dpi";
          InputSlot = "TRAY1";
          Duplex = "None";
          BRPassword = "False";
          TonerSaveMode = "OFF";
        };
      }
    ];
    ensureDefaultPrinter = "Alexander_BW";
  };
}

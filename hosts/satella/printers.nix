{ ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Epson_L3110_Kaede";
        location = "Home";
        deviceUri = "https://192.168.0.12:631/printers/EPSON_L3110_Series";
        model = "drv:///cupsfilters.drv/pwgrast.ppd";
        ppdOptions = {
          PageSize = "Letter";
        };
      }
    ];
    ensureDefaultPrinter = "Epson_L3110_Kaede";
  };

  hardware.sane = {
    enable = true;
    netConf = ''
      # IP Address or hostname of the scanner
      192.168.0.12
    '';
  };
}
{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.logiops ];

  systemd.services.logid = {
    description = "Logitech HID++ daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.logiops}/bin/logid";
      Restart = "always";
    };
  };

  environment.etc."logid.cfg".source = pkgs.writeText "logid.cfg" ''
    devices: [{
      name = "MX Master 3S";
      hiresscroll = { hires = true; target = "wheel"; step = 15; };
      dpi = 1200;
    }]
  '';
}

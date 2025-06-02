{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    logiops
  ];

  environment.etc."logid.cfg".text = ''
    devices: (
      {
        name = "MX Master 3S";
        smartshift:{
            on: true;
            threshold: 30;
            torque: 50;
        };
        hiresscroll: {
          enabled: true;
          invert: false;
          target: false;
        };
        dpi = 1200;
      }
    );
  '';

  systemd.services.logid = {
    description = "Logitech HID++ daemon";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.logiops}/bin/logid";
      Restart = "always";
    };
  };
}

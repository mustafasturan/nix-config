{ ... }:
{
  services.journald = {
    extraConfig = ''
      SystemMaxUse=100M
      SystemMaxFiles=10
    '';
    rateLimitBurst = 1000;
    rateLimitInterval = "30s";
  };
}

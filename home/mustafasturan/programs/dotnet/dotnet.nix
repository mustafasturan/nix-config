{ pkgs, ... }: {
  home.packages = [ pkgs.dotnet-sdk ];
  home.sessionVariables = {
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };
}

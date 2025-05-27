{ config, pkgs, lib, ... }: {
  boot.kernelModules = [ "kvm-amd" ];
  powerManagement.cpuFreqGovernor = "schedutil";
  hardware.cpu.amd.updateMicrocode = true;

  environment.systemPackages = with pkgs; [
    lm_sensors # For temperature monitoring
    zenmonitor # AMD-specific monitoring tool
  ];
}

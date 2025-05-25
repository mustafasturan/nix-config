{ config, pkgs, lib, ... }: {
  #boot.kernelModules = [ "kvm-amd" ];
  #powerManagement.cpuFreqGovernor = "schedutil";
  hardware.cpu.amd.updateMicrocode = true;
}

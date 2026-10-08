{ config, lib, pkgs, ... }:
{
  boot.loader.efi.canTouchEfiVariables = false;
  hardware.asahi.enable = true;
  hardware.asahi.peripheralFirmwareDirectory = (fetchTree {
    type = "path";
    path = "/boot/vendorfw/";
    narHash = "sha256-MIGz+B6vdtfLhYMjZxVl4PFJpeiN2Xq7b8fDpFjDNPo=";
  }).outPath;
}

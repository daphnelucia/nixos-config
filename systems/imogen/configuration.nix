{ config, lib, pkgs, ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;

  system.activationScripts.chmod-data.text = ''
    chmod 777 /mnt/data
  '';

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  environment.systemPackages = with pkgs; [
    pkgsi686Linux.gperftools
    steamcmd
  ];
}

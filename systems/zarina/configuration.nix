{ config, lib, pkgs, ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  networking.hosts = {
    "172.30.185.131" = ["biz.local"];
    #"127.0.0.1" = ["reddit.com" "www.reddit.com" "www.youtube.com" "youtube.com" "www.instagram.com" "instagram.com"];
  };

  fileSystems = let ntfs-drives = [
    "/mnt/hdd"
    "/mnt/windows"
  #  "/mnt/data"
  ]; in lib.genAttrs ntfs-drives (path: {
    # for write permissions for user
    options = ["uid=1000"];
  });

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

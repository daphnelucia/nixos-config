{ config, lib, pkgs, ... }:
{
  services.sunshine = {
    enable = true;
	autoStart = true;
	openFirewall = true;
  };
  users.users.lapochka.extraGroups = [ "uinput" ];
}

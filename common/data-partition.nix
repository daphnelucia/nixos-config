{ config, lib, pkgs, ... }:
{
  # todo: maybe data partition can be autodetected or maybe we don't even have to do this in the first place
  system.activationScripts.chmod-data.text = ''
    chmod 777 /mnt/data
  '';
}

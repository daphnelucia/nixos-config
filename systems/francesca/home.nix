{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    brightnessctl
	udiskie
  ];
  services.udiskie = {
    enable = true;
  };
}

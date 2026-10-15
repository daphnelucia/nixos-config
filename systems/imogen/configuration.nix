{ inputs, ... }:
{
  services.moonshine = {
    enable = true;
	user = "lapochka";
	openFirewall = true;
	settings = {
	  application = [
	    {
		  title = "Steam";
		  command = [
		    "/run/current-system/sw/bin/steam"
			"steam://open/bigpicture"
		  ];
		}
      ];
	};
  };
  users.users.lapochka.extraGroups = [ "uinput" "input" "moonshine" ];
}

{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		
		monitors = [ 
		  "HDMI-A-1"
		];
		autostartInWorkspace = [
		];
	};
}

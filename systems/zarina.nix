{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		
		monitors = [ 
			"HDMI-A-1" 
			"DP-1" 
		];
		autostartInWorkspace = [
			[
				"vesktop" # command
				"vesktop" # class
				7 # workspace
				2 # monitor
			]
			[
				"obs"
				"com.obsproject.Studio"
				9
				2
			]
			[
				"mumble"
				"info.mumble.Mumble"
				8
				2
			]
		];
	};
}

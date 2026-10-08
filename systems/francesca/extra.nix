{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		
		monitors = [ 
			"eDP-1"
		];
		autostartInWorkspace = [
			[
				"vesktop" # command
				"vesktop" # class
				7 # workspace
				1 # monitor
			]
		];
	};
}

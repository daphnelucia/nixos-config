{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		
		pw = {
			speakers = '''';
			headphones = '''';
		};

		monitors = [ 
		  "HDMI-A-1"
		];
		autostartInWorkspace = [
		];
	};
}

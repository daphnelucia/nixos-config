{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		browser = pkgs.librewolf;
		
		pw = {
			speakers = '''';
			headphones = '''';
		};

		screenshotFolder = "";

		monitors = [ 
		  "HDMI-A-1"
		];
		autostartInWorkspace = [
		];
	};
}

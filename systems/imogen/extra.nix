{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		
		monitors = [ 
		];
		autostartInWorkspace = [
		];
	};
}

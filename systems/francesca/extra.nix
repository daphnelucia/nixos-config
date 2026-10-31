{ pkgs }: {
	hyprland = {
		terminal = pkgs.alacritty;
		fileManager = pkgs.kdePackages.dolphin;
		menu = pkgs.fuzzel;
		
		pw = {
			speakers = ''.info.props."node.name" == "audio_effect.j413-convolver"'';
			headphones = ''.info.props."alsa.driver_name" == "snd_usb_audio" and .info.props."media.class" == "Audio/Sink"'';
		};

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
			[ "udiskie" ]
		];
	};
}

{ inputs, extraConfig }: {
  home-manager = {
	useGlobalPkgs = true;
	useUserPackages = true;
	extraSpecialArgs = { 
	  inherit inputs; 
	  flatpak = inputs.nix-flatpak.homeManagerModules.nix-flatpak;
	  withExtraConfig = (import ./withExtraConfig.nix) { 
	    sharedConfig = import ../home-shared.nix;
	    inherit extraConfig;
	  };
    };
	users.lapochka = ../home.nix;
	users.root = ../home-shared.nix;
  };
}


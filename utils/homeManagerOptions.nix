{ extraConfig }: {
  home-manager = {
	useGlobalPkgs = true;
	useUserPackages = true;
	extraSpecialArgs = { 
	  inherit inputs; 
	  flatpak = nix-flatpak.homeManagerModules.nix-flatpak;
	  withExtraConfig = (import ./utils/withExtraConfig.nix) { 
	    sharedConfig = import ./home-shared.nix;
	    inherit extraConfig;
	  };
    };
	users.lapochka = ./home.nix;
	users.root = ./home-shared.nix;
  };
}


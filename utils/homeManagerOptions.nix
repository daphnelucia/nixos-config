{ inputs, extraConfig, systemHome }: {
  home-manager = {
	useGlobalPkgs = true;
	useUserPackages = true;
	extraSpecialArgs = { 
	  inherit inputs;
      inherit systemHome;
	  flatpak = inputs.nix-flatpak.homeManagerModules.nix-flatpak;
	  vim-fennel = inputs.vim-fennel;
	  withExtraConfig = (import ./withExtraConfig.nix) { 
	    sharedConfig = import ../home-shared.nix;
	    inherit extraConfig;
	  };
    };
	users.lapochka = ../home.nix;
	users.root = ../home-shared.nix;
  };
}


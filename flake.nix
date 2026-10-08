{
  inputs = {
  	nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
	home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... } @ inputs: {
    nixosConfigurations.francesca = nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        { networking.hostName = "francesca"; }
		./systems/francesca/hardware.nix
		./apple-silicon-support
		./temp-config.nix
      ];
    };
    nixosConfigurations.zarina = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ 
		{ networking.hostName = "zarina"; }
		./systems/zarina/hardware.nix
	  	./configuration.nix
	
		home-manager.nixosModules.home-manager
		{
		  home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			extraSpecialArgs = { 
			  inherit inputs; 
			  flatpak = nix-flatpak.homeManagerModules.nix-flatpak;
			  withExtraConfig = (import ./utils/withExtraConfig.nix) { 
			  	sharedConfig = import ./home-shared.nix;
				extraConfig = import ./systems/zarina/extra.nix;
			  };
			};
		    users.lapochka = ./home.nix;
			users.root = ./home-shared.nix;
		  };
		}
	  ];
    };
  };
}

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
    nixosConfigurations.zarina = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ 
		{ networking.hostName = "zarina"; }
		./hardware/zarina.nix
	  	./configuration.nix
	
		home-manager.nixosModules.home-manager
		{
		  home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			extraSpecialArgs = { 
			  inherit inputs; 
			  sharedConfig = import ./home-shared.nix; 
			  flatpak = nix-flatpak.homeManagerModules.nix-flatpak;
			};
		    users.lapochka = ./home.nix;
			users.root = ./home-shared.nix;
		  };
		}
	  ];
    };
  };
}

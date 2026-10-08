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
	  system = "aarch64-linux";
      specialArgs = inputs;
      modules = [
        { networking.hostName = "francesca"; }
		./systems/francesca/hardware.nix
		./apple-silicon-support
		./configuration.nix
		./systems/francesca/configuration.nix
        
		home-manager.nixosModules.home-manager
		((import ./utils/homeManagerOptions.nix) {
		  inherit inputs;
		  extraConfig = import ./systems/francesca/extra.nix;
		})
      ];
    };
    nixosConfigurations.zarina = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ 
		{ networking.hostName = "zarina"; }
		./systems/zarina/hardware.nix
	  	./configuration.nix
		./systems/zarina/configuration.nix
	
		home-manager.nixosModules.home-manager
		((import ./utils/homeManagerOptions.nix) {
		  inherit inputs;
		  extraConfig = import ./systems/zarina/extra.nix;
		})
	  ];
    };
  };
}

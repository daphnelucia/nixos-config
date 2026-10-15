{
  inputs = {
  	nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
	home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... } @ inputs:
    let 
	  make-home-modules = name: [
	    home-manager.nixosModules.home-manager
		((import ./utils/homeManagerOptions.nix) {
		  inherit inputs;
		  systemHome = import ./systems/${name}/home.nix;
		  extraConfig = import ./systems/${name}/extra.nix;
		})
	  ];

	  make-x86_64-system = name: modules: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [ 
		  { networking.hostName = name; }
		  ./systems/${name}/hardware.nix
	  	
		  ./configuration.nix
		  ./common/standard-efi.nix
	      ./common/data-partition.nix	
		  ./common/steam.nix

		  ./systems/${name}/configuration.nix	
	    ] ++ make-home-modules name ++ modules;
    }; in {
      nixosConfigurations.francesca = nixpkgs.lib.nixosSystem {
	    system = "aarch64-linux";
        specialArgs = inputs;
        modules = [
          { networking.hostName = "francesca"; }
		  ./systems/francesca/hardware.nix
		  ./apple-silicon-support
		  ./configuration.nix
		  ./systems/francesca/configuration.nix
        ] ++ make-home-modules "francesca";
      };
      nixosConfigurations.zarina = make-x86_64-system "zarina" [];
      nixosConfigurations.imogen = make-x86_64-system "imogen" [];
    };
}

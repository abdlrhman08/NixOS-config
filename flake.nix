{
  description = "My system config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
   
    nbfc-linux = {
      url = "github:abdlrhman08/nbfc-linux/make_fix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, rust-overlay, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ({ pkgs, ... }: {
            nixpkgs = { 
	      overlays = [
	        (self: super: {
	          unstable = import nixpkgs-unstable {
		    system = "x86_64-linux";
		  };
	        })
	        rust-overlay.overlays.default
	      ];
	    };
          })
          ./hosts/default
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.extraSpecialArgs = { 
	      inherit inputs; 
	      unstable = import nixpkgs-unstable {
                system = "x86_64-linux";
	      };
	    };

	    home-manager.users.abdelrahman = import ./home.nix;
	  }
        ];
      };
    };
  };
}

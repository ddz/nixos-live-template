{
  description = "NixOS live OS template";
  
  # Automatically follow the most recent stable nixpkgs channel
  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";

  inputs.nshield = {
    url = "github:ddz/ncipher-nshield-solo";

    # Follow nixpkgs input to build kernel module for its kernel version
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nshield }: {
    # Build an ISO image by default
    packages.x86_64-linux.default = self.packages.x86_64-linux.iso;
    
    packages.x86_64-linux.iso =
      self.nixosConfigurations.live.config.system.build.isoImage;
    
    packages.x86_64-linux.vm =
      self.nixosConfigurations.live.config.system.build.vm;
    
    nixosConfigurations.live = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        nshield.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}

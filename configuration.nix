{ pkgs, modulesPath, ... }: {
  environment.systemPackages = [ pkgs.neovim ];

  # Configuration only applied to VM build
  virtualisation.vmVariant = {

    # Configure parameters in the run-nixos-vm script
    virtualisation = {
      # Make root filesystem non-persistent
      diskImage = null;

      # Give VM a sparse/compressed 16G disk image
      emptyDiskImages = [16384];

      # Run VM 16G
      memorySize = 16384;

      # Run in text-only QEMU connected to VM console
      graphics = false;
    };
  };
}

{ inputs, ... }:
let
    pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
    };
in
{
    virtualisation.docker.enable = true;

    virtualisation.vmware.host.enable = true;
    virtualisation.vmware.host.package = pkgs.vmware-workstation;
}

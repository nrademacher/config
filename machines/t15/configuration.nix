let
  meta = import ../../meta.nix;
in
{
  imports = [ ../../nixos/configuration.nix ./hardware-configuration.nix ];

  networking.hostName = meta.machines.t15.hostName;
}

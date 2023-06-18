let
  meta = import ../../meta.nix;
in
{
  imports = [ ../../systems/darwin/configuration.nix ];

  networking.hostName = meta.machines.mbp17.hostName;
}

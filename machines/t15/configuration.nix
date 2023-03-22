let
  meta = import ../../meta.nix;
in
{
  imports = [ ../../nixos/configuration.nix ./hardware-configuration.nix ];

  networking.hostName = meta.machines.t15.hostName;

  # Scaling for connected 4k monitor(s)
  environment.variables =
    {
      GDK_DPI_SCALE = "1.375";
    };

  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "DRI" "2"
    Option "TearFree" "true"
  '';
}

let
  meta = import ../../meta.nix;
in
{
  imports = [ ../../systems/nixos/configuration.nix ./hardware-configuration.nix ];

  networking.hostName = meta.machines.t15.hostName;

  # Scaling for connected 4k monitor(s)
  environment.variables =
    {
      GDK_DPI_SCALE = "1.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };

  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "DRI" "2"
    Option "TearFree" "true"
  '';
}

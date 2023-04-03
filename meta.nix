# Source of truth for recurring values used across multiple configurations

let
  username = "nrademacher";
in
{
  user = {
    name = "Nikolay Rademacher";
    username = username;
    emailAddresses = {
      private = "rademacher.nikolay@gmail.com";
    };
  };

  machines = {
    t15 = {
      hostName = "${username}-t15";
    };
    vd-t480 = {
      hostName = "${username}-vd-t480";
    };
  };
}

{
  lib,
  config,
  ...
}:
lib.mkIf config.user.overseer.enable {
  services.grocy = {
    enable = true;
    hostName = "grocy.wanderingcrow.net";
    nginx.enableSSL = false;
  };
}

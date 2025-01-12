{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "Parzival";

  user.crow.enable = true;

  desktop.sway.enable = true;
  desktop.i3.enable = true;

  module.gui.enable = true;
  module.programming.enable = true;
  module.hacking.enable = true;
  module.mudding.enable = true;
  module.gaming.enable = true;
  module.appdevel.enable = true;
  module.art.enable = true;

  service.note-sync.enable = true;

  programs.noisetorch.enable = true;

  virtualisation.vmware.host.enable = true;
}

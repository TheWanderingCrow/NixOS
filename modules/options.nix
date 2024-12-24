{
  config,
  lib,
  ...
}: {
  # Start definitions for mkEnableOptions
  options = {
    module = {
      enable = lib.mkEnableOption "enables packages";
      core.enable = lib.mkEnableOption "enables required packages";
      gui.enable = lib.mkEnableOption "enables gui+DE packages";
      wayland.enable = lib.mkEnableOption "enables wayland packages";
      x11.enable = lib.mkEnableOption "enables x11 packages";
      programming.enable = lib.mkEnableOption "enables programming packages";
      hacking.enable = lib.mkEnableOption "enables hacking packages";
      mudding.enable = lib.mkEnableOption "enables mudding packages";
      gaming.enable = lib.mkEnableOption "enables gaming packages";
      appdevel.enable = lib.mkEnableOption "enables app development in flutter";
      vr.enable = lib.mkEnableOption "enables VR utilities";
      art.enable = lib.mkEnableOption "enabled graphical art stuff";
    };

    user = {
      enable = lib.mkEnableOption "enables users";
      crow = {
        enable = lib.mkEnableOption "enable crow";
        home.enable = lib.mkEnableOption "enable home configuration";
      };
      overseer = {
        enable = lib.mkEnableOption "enable container overseer user";
      };
    };
  };

  # Set default option states in config
  config = {
    user = {
      enable = lib.mkDefault true;
      crow = {
        enable = lib.mkDefault false;
        home.enable = lib.mkDefault config.user.crow.enable;
      };
      overseer = {
        enable = lib.mkDefault false;
      };
    };

    module = {
      enable = lib.mkDefault true;
      core.enable = lib.mkDefault true;
      gui.enable = lib.mkDefault false;
      programming.enable = lib.mkDefault false;
      wayland.enable = lib.mkDefault false;
      x11.enable = lib.mkDefault false;
      hacking.enable = lib.mkDefault false;
      mudding.enable = lib.mkDefault false;
      gaming.enable = lib.mkDefault false;
      appdevel.enable = lib.mkDefault false;
      vr.enable = lib.mkDefault false;
      art.enable = lib.mkDefault false;
    };

    desktop = {
      sway.enable = lib.mkDefault false;
      i3.enable = lib.mkDefault false;
    };
  };
}
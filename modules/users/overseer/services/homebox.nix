{
  lib,
  config,
  ...
}:
lib.mkIf config.user.overseer.enable {
  services = {
    restic.backups.homebox = {
      user = "root";
      timerConfig = {
        OnCalendar = "hourly";
        Persistent = true;
      };
      paths = [
        "/var/lib/homebox/data"
      ];
      repositoryFile = config.sops.secrets."restic/url".path;
      passwordFile = config.sops.secrets."restic/key".path;
    };

    nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts = {
        "homebox.wanderingcrow.net" = {
          forceSSL = true;
          useACMEHost = "homebox.wanderingcrow.net";
          locations."/" = {
            extraConfig = ''
              allow 192.168.0.0/16;
              allow 10.8.0.0/24;
              allow 24.179.20.202;
              deny all;
            '';
            proxyPass = "http://localhost:7745";
            proxyWebsockets = true;
          };
        };
      };
    };

    homebox = {
      enable = true;
      settings = {
        HBOX_OPTIONS_ALLOW_REGISTRATION = "true";
      };
    };
  };
}

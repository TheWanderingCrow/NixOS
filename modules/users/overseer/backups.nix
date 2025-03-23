let
  volumePath = "/overseer/services";
  restic-default = {
    user = "root";
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
    paths = [
      # bar-assistant.nix
      "${volumePath}/bar-assistant"
      "${volumePath}/meilisearch"

      # homebox.nix
      "/var/lib/homebox/data"

      # lubelogger.nix
      "${volumePath}/lubelogger"

      # trilium.nix
      "/var/lib/trilium/backup"
    ];
  };
in
  {
    lib,
    config,
    ...
  }:
    lib.mkIf config.user.overseer.enable {
      # Restic secrets
      sops.secrets."restic/borg-base/url" = {};
      sops.secrets."restic/borg-base/key" = {};

      services.restic.backups = {
        borg-base =
          restic-default
          // {
            repositoryFile = config.sops.secrets."restic/borg-base/url".path;
            passwordFile = config.sops.secrets."restic/borg-base/key".path;
          };
      };
    }

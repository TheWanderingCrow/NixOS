{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:
lib.mkIf config.user.overseer.enable {
  # Homepage.dev secrets
  sops.secrets."homepage/openmeteo/lat" = {};
  sops.secrets."homepage/openmeteo/long" = {};
  sops.templates."homepage-environment".content = ''
    HOMEPAGE_VAR_LAT = ${config.sops.placeholder."homepage/openmeteo/lat"}
    HOMEPAGE_VAR_LONG = ${config.sops.placeholder."homepage/openmeteo/long"}
  '';

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts = {
      "home.wanderingcrow.net" = {
        locations."/" = {
          extraConfig = ''
            allow 192.168.0.0/16;
            deny all;
          '';
          proxyPass = "http://localhost:8082";
          proxyWebsockets = true;
        };
      };
    };
  };

  services = {
    homepage-dashboard = {
      enable = true;
      environmentFile = config.sops.templates."homepage-environment".path;
      settings = {
        theme = "dark";
      };
      widgets = [
        {
          search = {
            provider = "duckduckgo";
            target = "_blank";
          };
        }
        {
          openmeteo = {
            timezone = "America/New_York";
            units = "imperial";
            cache = "5";
            latitude = "{{HOMEPAGE_VAR_LAT}}";
            longitude = "{{HOMEPAGE_VAR_LONG}}";
          };
        }
      ];
      bookmarks = [
        {
          WCE = [
            {
              Homebox = [
                {
                  icon = "http://homebox.wanderingcrow.net/favicon.svg";
                  href = "http://homebox.wanderingcrow.net";
                }
              ];
            }
            {
              Bar = [
                {
                  icon = "http://bar.wanderingcrow.net/favicon.svg";
                  href = "http://bar.wanderingcrow.net";
                }
              ];
            }
            {
              Bookstack = [
                {
                  icon = "bookstack.svg";
                  href = "http://bookstack.wanderingcrow.net";
                }
              ];
            }
          ];
        }
        {
          "Day to Day" = [
            {
              Messages = [
                {
                  icon = "google-messages.svg";
                  href = "https://messages.google.com/web";
                }
              ];
            }
            {
              YouTube = [
                {
                  icon = "youtube.svg";
                  href = "https://youtube.com";
                }
              ];
            }
            {
              "Proton Mail" = [
                {
                  icon = "proton-mail.svg";
                  href = "https://mail.proton.me";
                }
              ];
            }
            {
              Crunchyroll = [
                {
                  icon = "https://www.crunchyroll.com/build/assets/img/favicons/favicon-v2-32x32.png";
                  href = "https://crunchyroll.com";
                }
              ];
            }
            {
              Instagram = [
                {
                  icon = "instagram.svg";
                  href = "https://instagram.com";
                }
              ];
            }
            {
              Aetolia = [
                {
                  icon = "https://aetolia.com/wp-content/uploads/2020/04/favicon.ico";
                  href = "https://aetolia.com";
                }
              ];
            }
            {
              Amazon = [
                {
                  icon = "amazon.svg";
                  href = "https://amazon.com";
                }
              ];
            }
          ];
        }
      ];
    };
  };
}

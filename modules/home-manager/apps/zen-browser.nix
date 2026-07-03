{ lib, config, inputs, pkgs, ...}:

let
  cfg = config.zen-browser;

in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  options = {
    zen-browser.enable = lib.mkEnableOption "Enable zen browser";
  };

  config = lib.mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      languagePacks = [ "it" "en-GB" ];
      /* ---- PROFILES ---- */
        profiles = { Light3r = {
          name = "Light3r";
          containersForce = true;
          containers = {
            Personal = {
              color = "green";
              icon = "fingerprint";
              id = 1;
            };
            Work = {
              color = "blue";
              icon = "briefcase";
              id = 2;
            };
            Shopping = {
              color = "yellow";
              icon = "dollar";
              id = 3;
            };
          };

          spacesForce = true;
          spaces = {
            "Personale" = {
              id = "l4b62ty7-386n-4015-hk9v-s2w0a257c93p";
              position = 1000;
              icon = "🏠";
            };
            "Scuola" = {
              id = "tln97shz-2tg0-163l-84v5-a10m330y817c";
              position = 2000;
              icon = "📚";
            };
            "Cybersecurity" = {
              id = "rbu20nlc-7wh4-651q-34o8-y91x024pjb6t";
              position = 3000;
              icon = "💻";
            };
          };

          bookmarks = {
            force = true;
            settings = [
              {
                name = "wikipedia";
                tags = [ "wiki" ];
                keyword = "wiki";
                url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
              }
              {
                name = "kernel.org";
                url = "https://www.kernel.org";
              }
              "separator"
              {
                name = "Nix sites";
                toolbar = true;
                bookmarks = [
                  {
                    name = "homepage";
                    url = "https://nixos.org/";
                  }
                  {
                    name = "wiki";
                    tags = [ "wiki" "nix" ];
                    url = "https://wiki.nixos.org/";
                  }
                ];
              }
            ];
          };

          /* ---- EXTENSIONS ---- */
          # Check about:support for extension/add-on ID strings.
          # Valid strings for installation_mode are "allowed", "blocked",
          # "force_installed" and "normal_installed".
          extensions = {
            force = true;
            packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
              darkreader
              adnauseam
              sponsorblock
              youtube-shorts-block
              bitwarden
              vimium
            ];
          };

          search = {
            force = true;
            default = "startpage";
            engines = {
              "searx" = {
                urls = [{
                  template = "https://search.jacoposoria.qzz.io/?q={searchTerms}";
                  params = [
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "https://docs.searxng.org/_static/searxng-wordmark.svg";
                definedAliases = [ "@sx" ];
              };

              "startpage" = {
                urls = [{
                  template = "https://www.startpage.com/sp/search?q={searchTerms}";
                  params = [
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "https://www.startpage.com/favicon.ico";
                definedAliases = [ "@sp" ];
              };

              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
            };
          };
        };
      };

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };
  };
}

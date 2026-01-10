{ inputs, pkgs, ...}:

{
  programs.librewolf = {
    enable = true;
    languagePacks = [ "it" "en-GB" ];

    /* ---- PROFILES ---- */
    profiles.Light3r = {
      name = "Light3r";

      search = {
        force = true;
        default = "searx";
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
          "qwant" = {
            urls = [{
              template = "https://www.qwant.com/?q={searchTerms}";
              params = [
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "https://www.qwant.com/favicon.ico";
            definedAliases = [ "@qw" ];
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
          #ublock-origin # Already included in librewolf
          sponsorblock
          youtube-shorts-block
        ];
      };
    };
  };
}

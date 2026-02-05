{ stdenv, fetchFromGitLab }:

{
  sddm-eucalyptus-drop = stdenv.mkDerivation rec {
    pname = "sddm-eucalyptus-drop-theme";
    version = "2.0.0";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/eucalyptus-drop
    '';
    src = fetchFromGitLab {
      owner = "Matt.Jolly";
      repo = "sddm-eucalyptus-drop";
      rev = "v${version}";
      sha256 = "wq6V3UOHteT6CsHyc7+KqclRMgyDXjajcQrX/y+rkA0=";
    };
  };
}

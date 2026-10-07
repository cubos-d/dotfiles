{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "chrome-os-dark";
  version = "2.4.3";

  src = pkgs.fetchFromGitHub {
    owner = "rtlewis1";
    repo = "GTK";
    rev = "ChromeOS-Dark"; #This is the branch
    sha256 = "sha256-BGIJ448nNGBLeOk6O+6AUXFK80UCzmJloYVDd1dKCx0=";
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r ChromeOS-Darker-UltraViolet-Rounded/ $out/share/themes/
  '';
}

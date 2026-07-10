# theme.nix
{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "chrome-os-dark";
  version = "2.4.3";

  src = pkgs.fetchFromGitHub {
    owner = "rtlewis1";
    repo = "GTK";
    rev = "ChromeOS-Dark";
    sha256 = "sha256-BGIJ448nNGBLeOk6O+6AUXFK80UCzmJloYVDd1dKCx0="; # Replace with your hash
  };

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r ChromeOS-Darker-UltraViolet-Rounded $out/share/themes/
  '';
}

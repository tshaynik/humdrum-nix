# allow our nixpkgs import to be overridden if desired
{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation rec {
  pname = "humdrum";
  version = "2.3.1";

  src = pkgs.fetchFromGitHub {
    owner = "humdrum-tools";
    repo = "humdrum";
    rev = "cec265df041b55cfbc64c0d719bd1800389a5566";
    sha256 = "1jwxb2jcsx5afaknp33dm5v0624khijn9rsspdzr1db36gbiqwl9";
  };

  nativeBuildInputs = [ pkgs.pkg-config pkgs.makeWrapper pkgs.file ];

  buildPhase = ''
    make bin
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    mkdir -p "$out/share/man"
    cp -r bin/* "$out/bin"
    cp -r "$src/toolkit-source/man/man1/" "$out/share/man/"

    # wrap all awk executables with HUMDRUM var
    for f in "$out"/bin/*; do
      if [[ -x "$f" ]] && file "$f" | grep -q 'ASCII text executable'; then
        wrapProgram "$f" --set HUMDRUM "$out"
      fi
    done
  '';
}

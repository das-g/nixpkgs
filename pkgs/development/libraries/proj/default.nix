{ stdenv, fetchFromGitHub, pkg-config, sqlite, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "proj";
  version = "6.3.0";

  src = fetchFromGitHub {
    owner = "OSGeo";
    repo = "PROJ";
    rev = version;
    sha256 = "0lf6jysfpzzxyxjwlmdl8vgsv503i4ccq8782w5dp86z4vfy48jv";
  };

  outputs = [ "out" "dev"];

  nativeBuildInputs = [ pkg-config autoreconfHook ];

  buildInputs = [ sqlite ];

  doCheck = stdenv.is64bit;

  meta = with stdenv.lib; {
    description = "Cartographic Projections Library";
    homepage = https://proj4.org;
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
    maintainers = with maintainers; [ vbgl ];
  };
}

{ stdenv, cmake, fetchsvn, pkgconfig, SDL, SDL_mixer, SDL_net }:

stdenv.mkDerivation rec {
  name = "odamex-20141019";
  src = fetchsvn {
    url = http://odamex.net/svn/root/trunk;
    rev = "5139";
    sha256 = "1lwnlb38fs9bgd7gw395czrgfxwj25h9jcjl5q3rv7war8crcyq3";
  };

  cmakeFlags = ''
    -DCMAKE_BUILD_TYPE=Release
  '';

  buildInputs = [ cmake pkgconfig SDL SDL_mixer SDL_net ];

  enableParallelBuilding = true;

  meta = {
    homepage = http://odamex.net/;
    description = "A client/server port for playing old-school Doom online";
    license = stdenv.lib.licenses.gpl2;
    maintainers = with stdenv.lib.maintainers; [ MP2E ];
  };
}

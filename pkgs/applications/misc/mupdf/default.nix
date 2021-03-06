{ stdenv, fetchurl, fetchpatch, pkgconfig, zlib, freetype, libjpeg, jbig2dec, openjpeg
, libX11, libXext }:
stdenv.mkDerivation rec {
  name = "mupdf-1.3";

  src = fetchurl {
    url = "http://mupdf.com/download/archive/${name}-source.tar.gz";
    sha256 = "0y247nka5gkr1ajn47jrlp5rcnf6h4ff7dfsprma3h4wxqdv7a5b";
  };

  patches = [(fetchpatch {
    name = "CVE-2014-2013.patch";
    url = "http://git.ghostscript.com/?p=mupdf.git;a=commitdiff_plain;"
      + "h=60dabde18d7fe12b19da8b509bdfee9cc886aafc";
    sha256 = "0p721f3g2djz9fy6rcgj83c20f5k257wg2d0yvvmp02m7sp06l0g";
  })];

  buildInputs = [ pkgconfig zlib freetype libjpeg jbig2dec openjpeg libX11 libXext ];

  enableParallelBuilding = true;

  preBuild = ''
    export makeFlags="prefix=$out build=release"
    export NIX_CFLAGS_COMPILE=" $NIX_CFLAGS_COMPILE -I$(echo ${openjpeg}/include/openjpeg-*) "
  '';

  postInstall = ''
    mkdir -p $out/share/applications
    cat > $out/share/applications/mupdf.desktop <<EOF
    [Desktop Entry]
    Type=Application
    Version=1.0
    Name=mupdf
    Comment=PDF viewer
    Exec=$out/bin/mupdf-x11
    Terminal=false
    EOF
  '';

  meta = {
    homepage = http://mupdf.com/;
    repositories.git = git://git.ghostscript.com/mupdf.git;
    description = "Lightweight PDF viewer and toolkit written in portable C";
    license = "GPLv3+";
    maintainers = with stdenv.lib.maintainers; [ viric ];
    platforms = with stdenv.lib.platforms; linux;
  };
}

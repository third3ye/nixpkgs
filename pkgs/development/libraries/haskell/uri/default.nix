{ cabal, parsec, safe, utf8String }:

cabal.mkDerivation (self: {
  pname = "uri";
  version = "0.1.6.2";
  sha256 = "0f2ms8awm4x7pw8ms6in0mxspqmnhv8bxas0947rkrzc5m9k0h3s";
  buildDepends = [ parsec safe utf8String ];
  meta = {
    homepage = "http://gitorious.org/uri";
    description = "Library for working with URIs";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})

{ cabal }:

cabal.mkDerivation (self: {
  pname = "transformers";
  version = "0.4.1.0";
  sha256 = "0jlnz86f87jndv4sifg1zpv5b2g2cxy1x2575x727az6vyaarwwg";
  meta = {
    description = "Concrete functor and monad transformers";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})

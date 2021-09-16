{ pkgs ? import (import nix/fetch-nixpkgs.nix) {}
}:

with pkgs;

stdenv.mkDerivation {
  name = "LaTeX-env";
  buildInputs = [ (texlive.combine {
                    inherit (texlive)
                      # collection of standard latex packages
                      scheme-small

                      # worksheet specific latex packages
                      environ
                      enumitem
                      exam
                      forest
                      inlinedef
                      pgfopts
                      polytable
                      lazylist
                      stmaryrd
                      trimspaces

                      # build tools
                      texfot
                      ;
                  })
                  # what haskell packages we want
                  haskellPackages.lhs2tex
                  # add more here e.g.
                  # haskellPackages.QuickCheck

                ];
  src = ./.;
  buildPhase = "make";

  meta = with lib; {
    description = "Describe your document here";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}

{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  language-asn = (
    with rec {
      language-asnSource = pkgs.lib.cleanSource ../.;
      language-asnBasic  = self.callCabal2nix "language-asn" language-asnSource { };
    };
    overrideCabal language-asnBasic (old: {
    })
  );
}

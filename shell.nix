let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);

  nixpkgs = import (fetchTarball "channel:nixos-20.09") {overlays = [moz_overlay];};
  ruststable = (nixpkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" "rls-preview" "rust-analysis" "rustfmt-preview" ];});
in
  with nixpkgs;
  mkShell {
    buildInputs = [ rustup ruststable ];
  }

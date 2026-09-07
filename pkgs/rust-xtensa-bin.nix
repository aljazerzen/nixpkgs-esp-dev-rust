{
  version ? "1.97.0.0",
  callPackage,
  lib,
  stdenv,
  fetchurl,
}:
let
  removeNulls = set: removeAttrs set (lib.filter (name: set.${name} == null) (lib.attrNames set));
  mkComponentSet = callPackage ./rust/mk-component-set.nix { inherit removeNulls; };
  mkAggregated = callPackage ./rust/mk-aggregated.nix { };

  selComponents = mkComponentSet {
    inherit version;
    renames = { };
    platform = "x86_64-linux";
    srcs = {
      rustc = fetchurl {
        url = "https://github.com/esp-rs/rust-build/releases/download/v${version}/rust-${version}-x86_64-unknown-linux-gnu.tar.xz";
        hash = "sha256-qZv+5pIh6f9thjiPaBHuaIzUBeagQAo80XhOjUY+nZk=";
      };
      rust-src = fetchurl {
        url = "https://github.com/esp-rs/rust-build/releases/download/v${version}/rust-src-${version}.tar.xz";
        hash = "sha256-Vo1oi5+PMy7E0EZXVE+tI+mc4R6ebPWDWXnmiijGi3M=";
      };
    };
  };

in
assert stdenv.system == "x86_64-linux";
mkAggregated {
  pname = "rust-xtensa";
  date = "2026-07-08";
  inherit version;
  availableComponents = selComponents;
  selectedComponents = [
    selComponents.rustc
    selComponents.rust-src
  ];
}

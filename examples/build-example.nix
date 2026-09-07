# Example derivation that builds a package provided by the `nixpkgs-esp-dev-rust`
# overlay. Pass in a `pkgs` instance that has the overlay applied, e.g.:
#
#   nix-build --expr 'let pkgs = import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; }; in import ./examples/build-example.nix { inherit pkgs; }'
{ pkgs }:

(pkgs.stdenv.mkDerivation {
  name = "overlay-example";

  buildInputs = with pkgs; [
    gcc-xtensa-lx106-elf-bin
  ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r ${pkgs.gcc-xtensa-lx106-elf-bin}/bin/* $out/bin/
    echo 'Member of the nixpkgs-esp-dev-rust overlay.' > $out/README
  '';
})
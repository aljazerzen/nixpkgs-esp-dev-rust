{ pkgs ? import ../default.nix, package, name ? "esp-idf-shell" }:
pkgs.mkShell {
  inherit name;
  buildInputs = [ package ];
}

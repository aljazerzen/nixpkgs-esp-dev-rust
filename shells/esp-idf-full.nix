{ pkgs ? import ../default.nix }:
import ./esp-idf.nix {
  inherit pkgs;
  package = pkgs.esp-idf-full;
  name = "esp-idf-full-shell";
}

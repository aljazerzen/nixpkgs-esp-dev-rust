{ pkgs ? import ../default.nix }:
import ./esp-idf.nix {
  inherit pkgs;
  package = pkgs.esp-idf-esp32s2;
  name = "esp-idf-esp32s2-shell";
}

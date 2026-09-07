{ pkgs ? import ../default.nix }:
import ./esp-idf.nix {
  inherit pkgs;
  package = pkgs.esp-idf-esp32c3;
  name = "esp-idf-esp32c3-shell";
}

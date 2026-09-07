{ pkgs ? import ../default.nix }:
import ./esp-idf-rust.nix {
  inherit pkgs;
  package = pkgs.esp-idf-esp32s2;
  name = "esp-idf-esp32s2-rust";
}

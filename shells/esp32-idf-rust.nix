{ pkgs ? import ../default.nix }:
import ./esp-idf-rust.nix {
  inherit pkgs;
  package = pkgs.esp-idf-esp32;
  name = "esp-idf-esp32-rust";
}

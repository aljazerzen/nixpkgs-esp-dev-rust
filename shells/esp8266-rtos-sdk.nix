{ pkgs ? import ../default.nix }:
import ./esp-idf.nix {
  inherit pkgs;
  package = pkgs.esp8266-rtos-sdk;
  name = "esp8266-rtos-sdk-shell";
}

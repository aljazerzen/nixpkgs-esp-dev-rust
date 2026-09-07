# nixpkgs-esp-dev-rust

Nix packages and development shells for ESP8266 and ESP32 devices, including
ESP-IDF, Xtensa/RISC-V toolchains, LLVM, and the ESP-RS Xtensa Rust toolchain.

## Development shells

With flakes:

```sh
nix develop github:aljazerzen/nixpkgs-esp-dev-rust#esp32-idf
```

Available shells are:

- `esp-idf-full`
- `esp32-idf`
- `esp32c3-idf`
- `esp32s2-idf`
- `esp32s3-idf`
- `esp32c6-idf`
- `esp32h2-idf`
- `esp32-idf-rust`
- `esp32s2-idf-rust`
- `esp8266-rtos-sdk`

Without flakes, use the corresponding file in `shells/` with `nix-shell`.

## Examples

- `examples/shell-standalone.nix` downloads the overlay and creates an ESP-IDF shell.
- `examples/shell-override-versions.nix` overrides the ESP-IDF revision and hash.

The overlay is available from `overlay.nix`, and the flake exports the same
packages and shells. The project is released under CC0; see `COPYING`.

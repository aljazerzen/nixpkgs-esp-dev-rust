{ pkgs ? import ../default.nix, package, name }:
pkgs.mkShell {
  inherit name;
  buildInputs = with pkgs; [
    package
    git
    wget
    gnumake
    flex
    bison
    gperf
    pkg-config
    cargo-generate
    cmake
    ninja
    ncurses5
    llvm-xtensa
    llvm-xtensa-lib
    rust-xtensa
    espflash
    ldproxy
    python3
    python3Packages.pip
    python3Packages.virtualenv
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [ pkgs.libxml2 pkgs.zlib pkgs.stdenv.cc.cc.lib ]}
    export ESP_IDF_VERSION=v4.4.1
    export LIBCLANG_PATH=${pkgs.llvm-xtensa-lib}/lib
    export RUSTFLAGS="--cfg espidf_time64"
  '';
}

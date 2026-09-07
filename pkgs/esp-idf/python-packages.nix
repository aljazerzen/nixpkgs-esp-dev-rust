{ stdenv
, lib
, fetchPypi
, fetchFromGitHub
, pythonPackages
}:

with pythonPackages;

rec {
  idf-component-manager = buildPythonPackage rec {
    pname = "idf-component-manager";
    version = "1.3.2";

    src = fetchFromGitHub {
      owner = "espressif";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-rHZHlvRKMZvvjf3S+nU2lCDXt0Ll4Ek04rdhtfIQ1R0=";
    };

    format = "setuptools";
    doCheck = false;

    propagatedBuildInputs = [
      cachecontrol
      cffi
      click
      colorama
      packaging
      pyyaml
      requests
      requests-file
      requests-toolbelt
      schema
      six
      tqdm
    ] ++ cachecontrol.optional-dependencies.filecache;

    # setup.py says it needs these deps, but it actually doesn't. contextlib2
    # isn't supported on some pythons and urllib3 is pinned to an old version
    postPatch = ''
      sed -i '/contextlib2/d' setup.py
      sed -i '/urllib3/d' setup.py
    '';

    meta = {
      homepage = "https://github.com/espressif/idf-component-manager";
    };
  };

  esp-coredump = buildPythonPackage rec {
    pname = "esp-coredump";
    version = "1.5.2";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-hQkXnGoAXCLk/PV7Y+C0hOgXGRY77zbIp2ZDC0cxfLo=";
    };

    pyproject = true;
    build-system = [ setuptools ];
    doCheck = false;

    propagatedBuildInputs = [
      construct
      pygdbmi
      esptool
    ];

    meta = {
      homepage = "https://github.com/espressif/esp-coredump";
    };
  };

  esptool = buildPythonPackage rec {
    pname = "esptool";
    version = "5.2.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-nDVbfWMxzJKXnMcQrlxB9Zgw0eop7CTEZ8YAWgksBtY=";
    };

    pyproject = true;
    build-system = [ setuptools ];
    doCheck = false;

    propagatedBuildInputs = [
      bitstring
      cryptography
      pyserial
      reedsolo
      pyyaml
      intelhex
      rich-click
      click
    ];

    meta = {
      homepage = "https://github.com/espressif/esptool";
    };
  };

  esp-idf-kconfig = buildPythonPackage rec {
    pname = "esp-idf-kconfig";
    version = "1.1.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-s8ZXt6cf5w2pZSxQNIs/SODAUvHNgxyQ+onaCa7UbFA=";
    };

    pyproject = true;
    build-system = [ setuptools ];
    doCheck = false;

    propagatedBuildInputs = [
      kconfiglib
    ];

    meta = {
      homepage = "https://github.com/espressif/esp-idf-kconfig";
    };
  };

  esp-idf-monitor = buildPythonPackage rec {
    pname = "esp-idf-monitor";
    version = "1.1.1";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-c62X3ZHRShhbAFmuPc/d2keqE9T9SXYIlJTyn32LPaE=";
    };

    pyproject = true;
    build-system = [ setuptools ];
    doCheck = false;

    propagatedBuildInputs = [
      pyserial
      esp-coredump
      pyelftools
    ];

    meta = {
      homepage = "https://github.com/espressif/esp-idf-monitor";
    };
  };

  esp-idf-size = buildPythonPackage rec {
    pname = "esp-idf-size";
    version = "0.3.1";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-OzthhzKGjyqDJrmJWs4LMkHz0rAwho+3Pyc2BYFK0EU=";
    };

    pyproject = true;
    build-system = [ setuptools ];
    doCheck = false;

    propagatedBuildInputs = [
      pyyaml
    ];

    meta = {
      homepage = "https://github.com/espressif/esp-idf-size";
    };
  };

  freertos_gdb = buildPythonPackage rec {
    pname = "freertos-gdb";
    version = "1.0.2";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-o0ZoTy7OLVnrhSepya+MwaILgJSojs2hfmI86D9C3cs=";
    };

    pyproject = true;
    build-system = [ setuptools ];
    doCheck = false;

    meta = {
      homepage = "https://github.com/espressif/freertos-gdb";
    };
  };

  esp-idf-panic-decoder = buildPythonPackage rec {
    pname = "esp-idf-panic-decoder";
    version = "0.2.0";

    format = "pyproject";
    
    src = fetchPypi {
      inherit version;
      pname = "esp_idf_panic_decoder";
      sha256 = "sha256-t1pg+L7WWVoVZ7weE/CUdMJsgRQvLEUE/GVeJpt0kKI=";
    };

    doCheck = false;

    propagatedBuildInputs = [
      setuptools
    ];

    meta = {
      homepage = "https://github.com/espressif/esp-idf-panic-decoder";
    };
  };
}


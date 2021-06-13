with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "blog";
  buildInputs = [
    hugo
  ];
  shellHook = ''
    make install_dependencies
    make build
  '';
}

with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "hugo";
  buildInputs = [
    hugo
  ];
  shellHook = ''
  make install_dependencies && make build
  '';
}

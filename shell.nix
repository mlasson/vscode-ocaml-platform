let
  pkgs = import
    (fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") { };
  local = (import ./default.nix { });
  strings = pkgs.lib.strings;
  inherit (pkgs) stdenv lib;
in with local;

pkgs.mkShell {
  inputsFrom = [ vscode vscode-ocaml-platform ];
  buildInputs = (with pkgs; [
    yarn
    nodejs-16_x
    gnumake
    ocamlformat_0_21_0
    ocaml-ng.ocamlPackages_4_13.ocaml-lsp
  ]);
}

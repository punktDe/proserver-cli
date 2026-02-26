{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: {
    overlays.default = final: prev: {
      proserver-cli = final.callPackage
        ({ stdenv, pkgs, ... }:
          stdenv.mkDerivation {
            src = ./.;
            pname = "proserver-cli";
            version = "1.0.1";
          }
        )
        { };
    };
  } //
  (flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        system = system;
        overlays = [ self.overlays.default ];
      };
      lib = nixpkgs.lib;
    in
    {
      packages = {
        proserver-cli = pkgs.writeScriptBin "proserver-cli" (builtins.readFile ./proserver);
        default = self.packages.${system}.proserver-cli;
      };
      formatter = pkgs.nixpkgs-fmt;

    }
  ));
}

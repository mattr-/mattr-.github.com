{
  description = "Nix flake for github-pages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in {
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.autoconf
          pkgs.automake
          pkgs.bundler
          pkgs.gcc
          pkgs.libxml2
          pkgs.libxslt
          pkgs.libyaml
          pkgs.libffi
          pkgs.pkg-config
          pkgs.ruby_3_2
        ];

        shellHook = ''
          export GEM_HOME=$PWD/.gem
          export PATH=$GEM_HOME/bin:$PATH
          export BUNDLE_USER_CONFIG=$PWD/.bundle/config
          export BUNDLE_PATH=$PWD/.bundle

          bundle install
        '';
      };
  });
  };
}

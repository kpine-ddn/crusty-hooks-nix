{
  description = "Nix package for crusty-hooks";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";

  outputs = { self, nixpkgs }:
  let
    forAllSystems = nixpkgs.lib.genAttrs [ "aarch64-darwin" "x86_64-linux" ];
  in
  {
    overlays.default = final: prev: {
      crusty-hooks = final.callPackage ./package.nix { };
    };

    packages = forAllSystems (system: {
      default = nixpkgs.legacyPackages.${system}.callPackage ./package.nix { };
    });

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
  };
}

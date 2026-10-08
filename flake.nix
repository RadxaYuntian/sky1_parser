{
  description = "A modern, user-friendly tool for interacting with Qualcomm devices in Emergency Download (EDL) mode";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, ... }@inputs:
    let
      eachSystem = inputs.nixpkgs.lib.genAttrs (import inputs.systems);
    in
    {
      devShells = eachSystem (system: {
        default =
          inputs.nixpkgs.legacyPackages.${system}.mkShellNoCC {
            buildInputs = with inputs.nixpkgs.legacyPackages.${system}; [
              inotify-tools
              python3
            ];
          };
      });

      formatter = eachSystem (system: inputs.nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
    };
}

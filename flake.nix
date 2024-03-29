{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }:  let
        architecture = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${architecture};
        makepdf = pkgs.writeScriptBin "makepdf" ''
            # Caching of images outside of this repo
            rm -rf cache
            mkdir -p cache
            cd cache
            ${pkgs.wget}/bin/wget https://github.githubassets.com/assets/github-mark-c791e9551fe4.zip
            ${pkgs.unzip}/bin/unzip github-mark-c791e9551fe4.zip
            ${pkgs.wget}/bin/wget https://www.design.aau.dk/digitalAssets/888/888340_261020_aau-logo.zip
            ${pkgs.unzip}/bin/unzip 888340_261020_aau-logo.zip
            cd ..

            # compile time!
            ${pkgs.texliveFull}/bin/pdflatex main.tex
        '';
    in {

        devShells.${architecture}.default = pkgs.mkShell {
            packages = with pkgs; [
                makepdf
            ];
        };

    };
}

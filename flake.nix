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
            mkdir -p cache/{aau,github}
            ${pkgs.wget}/bin/wget https://github.githubassets.com/assets/github-mark-c791e9551fe4.zip -O cache/github.zip
            ${pkgs.wget}/bin/wget https://www.aaudxp-cms.aau.dk/media/3bpeclt2/888357_261020_aau_pnglogo.zip -O cache/aau.zip
            ${pkgs.unzip}/bin/unzip cache/github.zip -d cache/github
            ${pkgs.unzip}/bin/unzip cache/aau.zip -d cache/aau

            # compile time!
            ${pkgs.texliveFull}/bin/pdflatex main.tex
            cp main.pdf CV.pdf
        '';
    in {

        devShells.${architecture}.default = pkgs.mkShell {
            packages = with pkgs; [
                makepdf
            ];
        };

    };
}

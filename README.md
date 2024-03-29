# CV

## Building

**Nix**

I have provided a flake with a devshell, which allows you to just run `makepdf` to compile everything.

**Other OS**

Depends:
```
texliveFull
wget
unzip
```
Preparation:
```
rm -rf cache
mkdir -p cache
cd cache
wget https://github.githubassets.com/assets/github-mark-c791e9551fe4.zip
wget https://www.design.aau.dk/digitalAssets/888/888340_261020_aau-logo.zip
unzip github-mark-c791e9551fe4.zip
unzip 888340_261020_aau-logo.zip
cd ..
```
Compile:
```
pdflatex main.tex
```

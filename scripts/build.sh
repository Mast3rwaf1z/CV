rm -rf cache
mkdir -p cache/github
mkdir -p cache/aau
wget https://github.githubassets.com/assets/github-mark-c791e9551fe4.zip -O cache/github.zip
wget https://www.design.aau.dk/digitalAssets/888/888340_261020_aau-logo.zip -O cache/aau.zip
unzip cache/github.zip -d cache/github
unzip cache/aau.zip -d cache/aau

pdflatex main.tex
mv main.pdf CV.pdf
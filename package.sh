#!/bin/bash

PKGNAME=draftwatermark
PKGVERS=2-0
PKGCNT=("draftwatermark.dtx" "draftwatermark.ins" "README" "draftwatermark.pdf")

# Process documentation
pdflatex draftwatermark.dtx
makeindex -s gind.ist draftwatermark
#makeindex -s gglo.ist -o draftwatermark.gls draftwatermark.glo
pdflatex draftwatermark.dtx
pdflatex draftwatermark.dtx

mkdir -p buildpkg/"$PKGNAME"_"$PKGVERS"
cp "${PKGCNT[@]}" buildpkg/"$PKGNAME"_"$PKGVERS"
chmod a+rx buildpkg/"$PKGNAME"_"$PKGVERS"
chmod a+r buildpkg/"$PKGNAME"_"$PKGVERS"/*
cd buildpkg
zip -r -9 "$PKGNAME"_"$PKGVERS".zip "$PKGNAME"_"$PKGVERS"
rm -fr "$PKGNAME"_"$PKGVERS"
cd ..
 

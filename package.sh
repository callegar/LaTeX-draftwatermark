#!/bin/bash

PKGNAME=draftwatermark
PKGVERS=2-2
PKGCNT=("README.md")
TESTFILES=("test_draftwatermark-1" "test_draftwatermark-2" \
           "test_draftwatermark-3" "test_draftwatermark-4" \
           "test_draftwatermark-5")
TESTENGINES=("pdflatex") 

build()
  {
    mkdir -p buildpkg/workdir
    cp "$PKGNAME".dtx "$PKGNAME".ins "${PKGCNT[@]}" buildpkg/workdir/
    cd buildpkg/workdir
    cat > docstrip.cfg <<EOF
\BaseDirectory{.}
\UseTDS
\askforoverwritefalse
EOF
    mkdir -p tex/latex/"$PKGNAME"
    mkdir -p doc/latex/"$PKGNAME"/examples
    tex "$PKGNAME".ins
    lualatex "$PKGNAME".dtx
    makeindex -s gind.ist "$PKGNAME"
    makeindex -s gglo.ist -o "$PKGNAME".gls "$PKGNAME".glo
    lualatex "$PKGNAME".dtx
    lualatex "$PKGNAME".dtx
    cp "$PKGNAME".pdf doc/latex/"$PKGNAME"/
    cd -
  }

do_test()
  {
    mkdir -p buildpkg/testdir
    cp buildpkg/workdir/tex/latex/"$PKGNAME"/"$PKGNAME".sty buildpkg/testdir
    cp buildpkg/workdir/doc/latex/"$PKGNAME"/examples/* buildpkg/testdir
    cd buildpkg/testdir
    for name in "${TESTFILES[@]}"; do
        for engine in "${TESTENGINES[@]}" ; do
            $engine "$name"
        done
    done
    cd -
  }

package()
  {  
    mkdir -p buildpkg/"$PKGNAME"_"$PKGVERS"
    cp "$PKGNAME".dtx "$PKGNAME".ins "${PKGCNT[@]}" \
       buildpkg/"$PKGNAME"_"$PKGVERS"/
    cp buildpkg/workdir/"$PKGNAME".pdf buildpkg/"$PKGNAME"_"$PKGVERS"/
    cd buildpkg
    zip -r -9 "$PKGNAME"_"$PKGVERS".zip "$PKGNAME"_"$PKGVERS"
    cd -
  }

clean()
  {
    cd buildpkg
    rm -fr ./workdir ./testdir ./"$PKGNAME"_"$PKGVERS" ./"$PKGNAME".tds.zip
    cd -
  }
    
build
do_test
package
clean
 

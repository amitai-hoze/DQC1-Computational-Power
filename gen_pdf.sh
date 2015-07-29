#! /bin/sh

NIX_GHC=$(type -p ghc)
if [ -n "$NIX_GHC" ]; then
  eval $(grep export "$NIX_GHC")
fi

pdflatex --shell-escape computing_the_jones_polynomial_in_dqc1_beamer.tex >& out
emacs out & >& /dev/null

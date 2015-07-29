#! /bin/sh

rm computing_the_jones_polynomial_in_dqc1_beamer.*
rm -r diagrams

emacs --no-desktop ~/dqc1/dqc1_jones_polynomial.org -l ~/org-mode/elisp/export_subtree.el --kill

NIX_GHC=$(type -p ghc)
if [ -n "$NIX_GHC" ]; then
  eval $(grep export "$NIX_GHC")
fi

pdflatex --shell-escape ~/dqc1/computing_the_jones_polynomial_in_dqc1_beamer.tex >& pdf_gen_out.txt
echo "Finished"
if grep -q failed ~/dqc1/pdf_gen_out.txt; then
    emacs ~/dqc1/pdf_gen_out.txt
else
    kde-open ~/dqc1/computing_the_jones_polynomial_in_dqc1_beamer.pdf    
fi
  

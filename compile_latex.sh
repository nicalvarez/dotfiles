#!/bin/sh
pdflatex $1
bibtex $1
pdflatex $1
pdflatex $1

for ext in bbl blg aux log
do
    rm $1.$ext
done


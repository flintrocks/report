#!/bin/bash

pdflatex -shell-escape cw && \
bibtex cw.aux && \
pdflatex -shell-escape cw && \
pdflatex -shell-escape cw

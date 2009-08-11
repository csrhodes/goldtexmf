NAME=gsexam

DOCSTRIP=pdflatex
PDFLATEX=pdflatex
MAKEINDEX=makeindex

all: $(NAME).cls $(NAME).sty $(NAME).pdf

include ../../../tools/latex-class-style.mk
include ../../../tools/latex-clean.mk
include ../../../tools/latex-doc.mk

test: $(NAME).cls $(NAME).sty test.tex
	latex test

NAME=gsexam

DOCSTRIP=pdflatex
PDFLATEX=pdflatex
MAKEINDEX=makeindex

all: $(NAME).cls $(NAME).sty $(NAME).pdf $(NAME)-internals.pdf

dist:
	git archive --prefix=$(NAME)-`git log --pretty="format:%H" -n 1` HEAD > gsexam-`git log --pretty="format:%H" -n 1`.tar
	gzip gsexam-`git log --pretty="format:%H" -n 1`.tar

release: $(NAME).cls $(NAME).sty $(NAME).pdf test.tex Makefile
	tar zcf $(NAME)-`date +"%Y%m%d"`.tar.gz --transform 's|^|'$(NAME)-`date +"%Y%m%d"`/'|' $^
	(tar zxf $(NAME)-`date +"%Y%m%d"`.tar.gz && zip -qr $(NAME)-`date +"%Y%m%d"`.zip $(NAME)-`date +"%Y%m%d"` && rm -rf ./$(NAME)-`date +"%Y%m%d"`)

-include ../../../tools/latex-class-style.mk
-include ../../../tools/latex-clean.mk
-include ../../../tools/latex-doc.mk

test: $(NAME).cls $(NAME).sty test.tex
	latex test
	latex test
	latex -jobname test-answers test
	latex -jobname test-answers test

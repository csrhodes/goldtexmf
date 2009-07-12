SHELL=/bin/bash

CLASS=esexamreport

DOCSTRIP=latex
PDFLATEX=pdflatex
MAKEINDEX=makeindex

all: $(CLASS).cls $(CLASS).pdf

$(CLASS).cls: $(CLASS).ins $(CLASS).dtx 
	$(DOCSTRIP) $<

$(CLASS).pdf: $(CLASS).dtx
	$(PDFLATEX) $<
	[ -f $(CLASS).glo ] && $(MAKEINDEX) -s gglo.ist -o $(CLASS).gls $(CLASS).glo
	[ -f $(CLASS).idx ] && $(MAKEINDEX) -s gind.ist -o $(CLASS).ind $(CLASS).idx
	$(PDFLATEX) $<

clean:
	rm -f $(CLASS).{aux,cls,dvi,glo,gls,idx,ilg,ind,log,pdf,ps}

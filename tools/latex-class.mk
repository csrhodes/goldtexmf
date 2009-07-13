SHELL=/bin/bash

$(CLASS).cls: $(CLASS).ins $(CLASS).dtx 
	$(DOCSTRIP) $<

$(CLASS).pdf: $(CLASS).dtx
	$(PDFLATEX) $<
	[ -f $(CLASS).glo ] && $(MAKEINDEX) -s gglo.ist -o $(CLASS).gls $(CLASS).glo
	[ -f $(CLASS).idx ] && $(MAKEINDEX) -s gind.ist -o $(CLASS).ind $(CLASS).idx
	$(PDFLATEX) $<


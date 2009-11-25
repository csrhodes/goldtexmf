$(NAME).pdf: $(NAME).dtx
	$(PDFLATEX) "\AtBeginDocument{\OnlyDescription} \input $<"
	[ -f $(NAME).glo ] && $(MAKEINDEX) -s gglo.ist -o $(NAME).gls $(NAME).glo
	[ -f $(NAME).idx ] && $(MAKEINDEX) -s gind.ist -o $(NAME).ind $(NAME).idx
	$(PDFLATEX) "\AtBeginDocument{\OnlyDescription} \input $<"

$(NAME)-internals.pdf: $(NAME).dtx
	$(PDFLATEX) -jobname $(NAME)-internals $<
	[ -f $(NAME)-internals.glo ] && $(MAKEINDEX) -s gglo.ist -o $(NAME)-internals.gls $(NAME)-internals.glo
	[ -f $(NAME)-internals.idx ] && $(MAKEINDEX) -s gind.ist -o $(NAME)-internals.ind $(NAME)-internals.idx
	$(PDFLATEX) -jobname $(NAME)-internals $<



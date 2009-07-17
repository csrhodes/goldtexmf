$(NAME).pdf: $(NAME).dtx
	$(PDFLATEX) $<
	[ -f $(NAME).glo ] && $(MAKEINDEX) -s gglo.ist -o $(NAME).gls $(NAME).glo
	[ -f $(NAME).idx ] && $(MAKEINDEX) -s gind.ist -o $(NAME).ind $(NAME).idx
	$(PDFLATEX) $<

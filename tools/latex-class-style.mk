$(NAME).cls $(NAME).sty: $(NAME).ins $(NAME).dtx 
	$(DOCSTRIP) $<

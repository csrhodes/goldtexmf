SHELL=/bin/bash

clean:
	rm -f $(NAME).{aux,cls,dvi,glo,gls,idx,ilg,ind,log,pdf,ps,sty}
	rm -f $(NAME)-internals.{aux,dvi,glo,gls,idx,ilg,ind,log,pdf,ps}

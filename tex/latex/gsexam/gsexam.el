(TeX-add-style-hook
 "gsexam"
 (lambda ()
   (LaTeX-add-environments "bscexam" "question" "answer")
   (make-local-variable 'LaTeX-indent-environment-list)
   ;; The below makes the answer environment a bit like verbatim, in
   ;; that M-q (`fill-paragraph') will refuse to fill.  Using (lambda
   ;; () 2) instead of `current-indentation' indents the body of the
   ;; answer environment correctly, but still refuses to fill on M-q.
   ;; Without the directive, the indentation of the environments
   ;; contents is forced to the left (except in nested environments,
   ;; which add 2 to the indentation level as one might like) but
   ;; filling works, so let's go with that.
   ;; (add-to-list 'LaTeX-indent-environment-list '("answer" current-indentation))
   (make-local-variable 'LaTeX-verbatim-regexp)
   (setq LaTeX-verbatim-regexp (concat LaTeX-verbatim-regexp "\\|answer"))
   (add-to-list 'LaTeX-verbatim-environments-local "answer")
   ;; Fontification
   (when (and (featurep 'font-latex)
              (eq TeX-install-font-lock 'font-latex-setup))
     ;; For syntactic fontification, e.g. verbatim constructs.
     (font-latex-set-syntactic-keywords)
     ;; Tell font-lock about the update.
     (setq font-lock-set-defaults nil)
     (font-lock-set-defaults))))

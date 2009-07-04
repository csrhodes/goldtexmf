(TeX-add-style-hook
 "gsexam"
 (lambda ()
   (LaTeX-add-environments "bscexam" "question" "answer")
   (make-local-variable 'LaTeX-indent-environment-list)
   (add-to-list 'LaTeX-indent-environment-list '("answer" current-indentation))
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

;;(latex-preview-pane-enable)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2020/bin/x86_64-linux"))  
(setq exec-path (append exec-path '("/usr/local/texlive/2020/bin/x86_64-linux")))

(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-add-environments
	      '("empheq" LaTeX-env-label)
	      '("align" LaTeX-env-label)
              '("aligned" LaTeX-env-label)
              '("thm" LaTeX-env-label)
              '("lem" LaTeX-env-label)
              '("defn" LaTeX-env-label)
              '("conv" LaTeX-env-label)
              '("rem" LaTeX-env-label)
	      '("cor" LaTeX-env-label)
              '("prof" LaTeX-env-label))))

(add-hook 'LaTeX-mode-hook 
	   (lambda ()
	     (prettify-symbols-mode 1)
             (TeX-fold-mode 1)
	     (LaTeX-math-mode 1)))

(setq TeX-fold-env-spec-list(quote(
	("[figure]"("figure"))
	("[table]"("table"))
	("[itemize]"("itemize"))
	("[overpic]"("overpic")))))

(setq TeX-show-compilation nil)
(setq TeX-clean-confirm nil)
(setq TeX-save-query nil)

(setq LaTeX-indent-level 4) 
(setq LaTeX-item-indent 0)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'latex-mode-hook 'turn-on-cdlatex)

(if (string-equal system-type "windows-nt")
    (require 'tex-mik))

(add-hook 'latex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)

;; set XeTeX mode in TeX/LaTeX
(add-hook 'LaTeX-mode-hook 
          (lambda()
             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex %(mode) -shell-escape -8bit%' %t" TeX-run-TeX nil t))
             (setq TeX-command-default "XeLaTeX")
             (setq TeX-save-query nil)
             (setq TeX-show-compilation t)))

(require 'yasnippet)
(yas-global-mode 1)

(provide 'init-latex)

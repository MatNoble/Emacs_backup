;; org

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(require 'org)

(setq org-image-actual-width nil)

(eval-after-load "org"
  '(require 'ox-md nil t))

;; 语法高亮
(setq org-src-fontify-natively t)

;;(require 'org-gcal)
;;(setq org-gcal-client-id "596809821661-von4chu8fclre39h9ctoi9c69i20cu24.apps.googleusercontent.com"
;;      org-gcal-client-secret "m1hFPKgXcZuL7SwjPfWa6OvT"
;;      org-gcal-file-alist '(("hustmatnoble@gmail.com" .  "~/schedule.org")))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; 打开 org-indent mode
(setq org-startup-indented t)

;; 设置 bullet list
;;(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
(setq org-bullets-bullet-list '("♕" "☮" "☸" "✪"))

(custom-set-faces

  '(org-level-1 ((t (:foreground "#4285F4" :bold t))))

  '(org-level-2 ((t (:foreground "#DB4437" :bold t))))

  '(org-level-3 ((t (:foreground "#F4B400" :bold t))))

  '(org-level-4 ((t (:foreground "#0F9D58" :bold t))))

  )

(setq org-agenda-files '("~/org/agenda"))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; 自动换行
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

;;(require 'htmlize)
;;(setq org-html-doctype "html5")
;;(setq org-html-xml-declaration nil)
;;(setq org-html-postamble nil)
;;(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/home/hustross/.emacs.d/org.css\" />")
;;(setq org-html-htmlize-output-type 'css)

(setq org-capture-templates '(
                  ("i" "inbox" entry (file+headline "~/gtd/inbox.org" "inbox")
                               "* TODO [#B] %U %i%?" :empty-lines 1)
                              ("s" "someday" entry (file+headline "~/gtd/someday.org" "some day")
                               "* TODO [#C] %U %i%?" :empty-lines 1)
                  ("g" "GTD" entry (file+datetree "~/gtd/gtd.org")
                   "* TODO [#B] %U %i%?" :empty-lines 1)
                  ))

(setq org-todo-keywords '((sequence "TODO" "DOING" "DELAY" "DONE")))
(setq org-todo-keyword-faces '(("TODO" . "red")
                               ("DOING" . "yellow")
                               ("DELAY" . "black")
                               ("DONE" . "green")))

;; 设置 org-agenda 展示的文件
(setq org-agenda-files '("~/gtd/inbox.org"
                         "~/gtd/gtd.org"
                         "~/gtd/someday.org"))

;;org-mode export to latex
(require 'ox-latex)
(setq org-export-latex-listings t)

;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

;;org-mode source code setup in exporting to latex
  (add-to-list 'org-latex-listings '("" "listings"))
  (add-to-list 'org-latex-listings '("" "color"))

  (add-to-list 'org-latex-packages-alist
               '("" "xcolor" t))
  (add-to-list 'org-latex-packages-alist
               '("" "listings" t))
  (add-to-list 'org-latex-packages-alist
               '("" "fontspec" t))
  (add-to-list 'org-latex-packages-alist
               '("" "indentfirst" t))
  (add-to-list 'org-latex-packages-alist
               '("" "geometry"))
  (add-to-list 'org-latex-packages-alist
               '("" "float"))
  (add-to-list 'org-latex-packages-alist
               '("" "longtable"))
  (add-to-list 'org-latex-packages-alist
               '("" "tikz"))
  (add-to-list 'org-latex-packages-alist
               '("" "fancyhdr"))
  (add-to-list 'org-latex-packages-alist
               '("" "textcomp"))
  (add-to-list 'org-latex-packages-alist
               '("" "amsmath"))
  (add-to-list 'org-latex-packages-alist
               '("" "tabularx" t))
  (add-to-list 'org-latex-packages-alist
               '("" "booktabs" t))
  (add-to-list 'org-latex-packages-alist
               '("" "grffile" t))
  (add-to-list 'org-latex-packages-alist
               '("" "wrapfig" t))
  (add-to-list 'org-latex-packages-alist
               '("normalem" "ulem" t))
  (add-to-list 'org-latex-packages-alist
               '("" "amssymb" t))
  (add-to-list 'org-latex-packages-alist
               '("" "capt-of" t))
  (add-to-list 'org-latex-packages-alist
               '("figuresright" "rotating" t))
  (add-to-list 'org-latex-packages-alist
               '("Lenny" "fncychap" t))

;; book
  (add-to-list 'org-latex-classes
               '("matnoble-org-book"
                 "\\documentclass{book}
\\usepackage[UTF8]{ctex}
\\usepackage{amsmath,amsthm,amsfonts,amssymb,bm}
;; chapter set
\\usepackage{titlesec}
\\usepackage{hyperref}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\newcommand\\fontnamehei{SourceHanSansSC-Regular} 
\\newcommand\\fontnamesong{SourceHanSerifSC-Regular} 
\\newcommand\\fontnamekai{Adobe Kaiti Std}
\\newcommand\\fontnamemono{Adobe Fangsong Std}
\\setCJKmainfont[BoldFont=\fontnamehei]{\fontnamesong} % 设置 CJK 主字体
\\setCJKsansfont[BoldFont=\fontnamehei]{\fontnamekai}  % 设置 CJK 无衬线的字体
\\setCJKmonofont{\fontnamemono}                           % 设置 CJK 的等宽字体
\\punctstyle{kaiming}

\\setmainfont[Mapping=tex-text]{Times New Roman}
\\setsansfont[Mapping=tex-text]{Arial}
\\setmonofont[Mapping=tex-text]{DejaVu Sans Mono}

;; 如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

;; 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

;; 代码设置
\\lstset{numbers=left,
numberstyle= \\tiny,
keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
frame=shadowbox,
breaklines=true,
rulesepcolor= \\color{ red!20!green!20!blue!20}
}
[EXTRA]
"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; article
(add-to-list 'org-latex-classes
               '("matnoble-org-article"
                 "\\documentclass{article}
\\usepackage[UTF8]{ctex}
\\usepackage{amsmath,amsthm,amsfonts,amssymb,bm}
\\usepackage{titlesec}
\\usepackage{hyperref}
\\usepackage{microtype}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\parindent 2em

\\newcommand\\fontnamehei{SourceHanSansSC-Regular} 
\\newcommand\\fontnamesong{SourceHanSerifSC-Regular} 
\\newcommand\\fontnamekai{Adobe Kaiti Std}
\\newcommand\\fontnamemono{Adobe Fangsong Std}
\\setCJKmainfont[BoldFont=\\fontnamehei]{\\fontnamesong} % 设置 CJK 主字体
\\setCJKsansfont[BoldFont=\\fontnamehei]{\\fontnamekai}  % 设置 CJK 无衬线的字体
\\setCJKmonofont{\\fontnamemono}                           % 设置 CJK 的等宽字体
\\punctstyle{kaiming}

\\setmainfont[Mapping=tex-text]{Times New Roman}
\\setsansfont[Mapping=tex-text]{Arial}
\\setmonofont[Mapping=tex-text]{DejaVu Sans Mono}

\\defaultfontfeatures{Mapping=tex-text}

\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

\\lstset{numbers=left,
numberstyle= \\tiny,
keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
frame=shadowbox,
breaklines=true,
rulesepcolor= \\color{ red!20!green!20!blue!20}
}
[EXTRA]
"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; beamer
  (add-to-list 'org-latex-classes
               '("matnoble-org-beamer"
                 "\\documentclass{beamer}
\\usepackage[UTF8]{ctex}
;; beamer set
\\usepackage[none]{hyphenat}
\\usepackage[abs]{overpic}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\setCJKmainfont{SourceHanSansSC-Regular} 
\\setCJKsansfont{SourceHanSansSC-Regular}
\\setCJKmonofont{DejaVu Sans Mono}

\\setmainfont{Times New Roman}
\\setsansfont{Arial}
\\setmonofont{Courier New}

\\defaultfontfeatures{Mapping=tex-text}

\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

\\lstset{numbers=left,
numberstyle= \\tiny,
keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
frame=shadowbox,
breaklines=true,
rulesepcolor= \\color{ red!20!green!20!blue!20}
}
[EXTRA]
"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode -output-directory %o %f"
          ;;"biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"))

(provide 'init-org)

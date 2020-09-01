;; packages
(when (>= emacs-major-version 24)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			      ("melpa" . "http://elpa.emacs-china.org/melpa/")
			      ("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
     )
     

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar MatNoble/packages '(
                ;; --- Auto-completion ---
                autoinsert
                company
		company-jedi
		company-tabnine
		company-auctex
		yasnippet
                try
                which-key
                org-gcal
                ;; --- Better Editor ---
                hungry-delete
                swiper
                counsel
                smartparens
		;; smex
                ;; --- Major Mode ---
                ;; js2-mode ;; (to write javascript)
                ;; --- Minor Mode ---
                nodejs-repl
                exec-path-from-shell
	        org-bullets
		markdown-mode
		grip-mode
		;;latex-preview-pane
		auctex
		cdlatex
		reftex
                ;; --- Themes ---
                monokai-theme
                ;; solarized-theme
		popwin
		htmlize
		elpy
		flycheck ;; add the flycheck package
		py-autopep8
                ) "Default packages")

(setq package-selected-packages MatNoble/packages)

 (defun MatNoble/packages-installed-p ()
     (loop for pkg in MatNoble/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (MatNoble/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg MatNoble/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; Find Executable Path on OS X
;; (when (memq window-system '(mac ns))
;; (exec-path-from-shell-initialize))

;; 快速删除
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 自动补全括号
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; company 补全模式
(global-company-mode t)
;;(use-package company-tabnine :ensure t)
;;(require 'company-tabnine)
;;(add-to-list 'company-backends #'company-tabnine)
(require 'company-auctex)
(company-auctex-init)

;; 主题应用
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)

(setq auto-insert-directory (locate-user-emacs-file "templates"))
(auto-insert-mode)
(add-hook 'find-file-hook 'auto-insert)
(setq auto-insert-query nil)
(define-auto-insert "\\.org" "default-org.org")
(define-auto-insert "\\.tex" "default-tex.tex")
(define-auto-insert "\\.py" "default-fpy.py")

;; which-key
(require 'which-key)
(which-key-mode)
;; 关闭错误提示音
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode t)

;; 快速补全
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table'(
					   ("1m" "MatNoble")
					   ))
;; 禁止备份文件
(setq make-backup-files nil)

(setq auto-save-default nil)

;; 最近文件查找
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 替换并删除
(delete-selection-mode 1)

;; 当前行高亮
(global-hl-line-mode t)

;; 关闭缩进
(electric-indent-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

(require 'dired-x)

(setq dired-dwim-target t)

(provide 'init-better-defaults)

(global-set-key (kbd "C-SPC") nil)

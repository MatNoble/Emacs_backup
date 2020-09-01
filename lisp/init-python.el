;; python package

;; 启用 elpy
(elpy-enable)
;; ipython
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i --simple-prompt")
;; 消除警告
(setq python-shell-completion-native-enable nil)

;; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))

;; jedi
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(setq compandy-minimum-prefix-length 3)
(setq company-tooltip-align-annotations t)
(setq company-transformers '(company-sort-by-occurrence))
(setq company-selection-wrap-around t)

;; 多行注释
(global-set-key [?\C-c ?\C-a] 'comment-or-uncomment-region)

(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg)
)
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)

(provide 'init-python)

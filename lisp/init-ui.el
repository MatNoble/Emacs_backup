;; 关闭启动画面
(setq inhibit-splash-screen 1)

;; 全屏开启
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 关闭工具栏, tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 更改光标样式
(setq-default cursor-type 'bar)

;; 更改显示文字大小 12pt
;; (set-face-attribute 'default nil :height 120)

;; (set-default-font "Source Code Pro Bold 12")
;;中文与外文字体设置
;; (defun set-font (english chinese english-size chinese-size)
;;  (set-face-attribute 'default nil :font
;;                      (format   "%s:pixelsize=%d"  english english-size))
;;  (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;    (set-fontset-font (frame-parameter nil 'font) charset
;;                      (font-spec :family chinese :size chinese-size))))
;;(set-font   "Cascadia Code" "SourceHanSerifSC-Regular" 21 19)
;; WenQuanYi Zen Hei Mono Source Code Pro Fira Code

;; 显示时间，格式如下  
;;(display-time-mode 1)  
;;(setq display-time-24hr-format t)  
;;(setq display-time-day-and-date t)

(provide 'init-ui)

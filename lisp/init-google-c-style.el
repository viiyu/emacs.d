;; google-c-style.el

(install-package 'google-c-style)

(defun my-c-style ()
  (setq c-basic-offset 4          ;; 基本缩进宽度
	indent-tabs-mode nil      ;; 禁止空格替换Tab
	tab-width 4))     ;; 默认Tab宽度
(add-hook 'c-mode-common-hook 'my-c-style)
;;(add-hook 'c-mode-common-hook '(lambda()
;;				 (c-set-style "cc-mode")))

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent) 
(provide 'init-google-c-style)

;;;; init-company.el

;;company-mode 
;; install company-mode
(require-package 'company)
;; include company
(require 'company)
;; 将显示延时关掉
(setq company-idle-delay nil)
;;
(setq company-require-match nil)
(setq company-auto-complete nil)
;; 开启补全
(setq company-mode t)
;; 添加全局补全
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "M-TAB") 'company-complete)

(deftheme jellybeans
      "Created 2013-11-05.")
(custom-theme-set-faces
 'jellybeans
 '(cursor ((t (:background "#000000"))))
 '(default ((t (:inherit nil :background "#000000" :foreground "#000000"))))
 ;; company
 '(company-tooltip ((t (:background "#000000" :foreground "#ffffff")))))

(provide 'init-company)

;; init-ace-jump.el

;; ace-jump
(require-package 'ace-jump-mode)
(require 'ace-jump-mode)

(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)
    
(provide 'init-ace-jump)

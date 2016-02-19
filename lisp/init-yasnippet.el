;;;; init-yasnippet.el
;; install
(require-package 'yasnippet)
;; include company
(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/snippets/")))
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(provide 'init-yasnippet)


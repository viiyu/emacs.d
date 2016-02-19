;;;; init-cedet.el

;; cedet
(require 'cedet)
;;(autoload 'cedet "cedet" "cedet" t)
;;(autoload 'ede "ede" "ede" t)
(require 'ede)
(global-ede-mode 1)

;;;;  Helper tools.
(custom-set-variables
 '(semantic-default-submodes (quote (
                                     global-semantic-decoration-mode
                                     global-semantic-stickyfunc-mode
                                     ;; global-semantic-idle-completions-mode
                                     global-semantic-idle-scheduler-mode
                                     global-semanticdb-minor-mode
                                     global-semantic-idle-summary-mode
                                     global-semantic-mru-bookmark-mode
				     )))
 '(semantic-idle-scheduler-idle-time 3))

(require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (global-semantic-idle-completions-mode 1)
(semantic-mode 1)
;; smart complitions
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle
		 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
		 '(project unloaded system recursive))

;;;; Include settings
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)

(defvar cedet-user-include-dirs)
;; ;; project include setting
(defconst cedet-user-include-dirs
  (list "." ".." "../include" "../inc" "../common" "../public" "../config" "../util"))

;; ;; system include setting
(setq cedet-sys-include-dirs (list
			      "/usr/include"
			      "/usr/include/bits"
			      "/usr/include/glib-2.0"
			      "/usr/include/gnu"
			      "/usr/local/include"
                  "/usr/include/c++/4.1.2"
                  "/usr/local/include"
                  "/usr/include/c++"
))

(let ((include-dirs cedet-user-include-dirs))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
	  (semantic-add-system-include dir 'c++-mode)
	  (semantic-add-system-include dir 'c-mode))
	include-dirs))

(setq semantic-c-dependency-system-include-path  (list
			      "/usr/include"
			      "/usr/include/gnu"
			      "/usr/local/include"
                  "/usr/include/c++/4.1.2"
                  "/usr/local/include"
                  "/usr/include/c++"
))

;;;; Semantic DataBase存储位置
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/semanticdb"))

;; ===============================================================
;;
;; ==============================================================
;; customisation of modes
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  ;; (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\M-/" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c <SPC>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cb" 'semantic-mrub-switch-tags)
)

(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'c++-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
(add-hook 'python-mode-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (local-set-key "\C-c." 'semantic-complete-self-insert)
  ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(global-unset-key (kbd "M-TAB") )
(global-unset-key (kbd "C-M-i") )

(provide 'init-cedet)

;; init-epla.el

;; package.el
(require 'package) ;; 
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line(require 'package)


;; define require-package function
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.If NO-REFRESH is non-nil, the available package lists will not be re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(package-install package)
      (progn
	(package-refresh-contents)
	(require-package package min-version t)))))

(defun install-package (package)
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
;;  (dolist (package demo-packages)
  (unless (package-installed-p package)
    (package-install package)))

(package-initialize)
(provide 'init-elpa)

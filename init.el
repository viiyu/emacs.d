(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; ================================================
;; load extension
;; =================================================
(require 'init-utils)
(require 'init-elpa)
(require 'init-cedet)
(require 'init-google-c-style)
;; (require 'init-helm)
(require 'init-company)
(require 'init-gdb)
;; (require 'init-magit)
;; (require 'init-markdown)
;; (require 'init-ggtags)
(require 'init-smex)
(require 'init-yasnippet)
(require 'init-ctag)

;; ================================================
;; Theme
;; ================================================
(require 'hober-theme)
;;(require 'subatomic256-theme)

;; =================================================
;; 插件
;; =================================================
(require 'ido)
(ido-mode t)
;; code mode
;; (require 'cc-mode)
;; (defun my-c-style ()
;;   (setq c-basic-offset 4          ;; 基本缩进宽度
;; 	indent-tabs-mode t        ;; 禁止空格替换Tab
;; 	default-tab-width 4))     ;; 默认Tab宽度
;; (add-hook 'c-mode-common-hook 'my-c-style)

;; window-numbering.el
(require 'window-numbering)
(window-numbering-mode)
(require 'hl-line)
;;;eassist
(require 'eassist)
;;(autoload 'eassist "eassist" "" nil)
(defun my-c-mode-common-hook ()
  (define-key c-mode-base-map (kbd "C-c t") 'eassist-switch-h-cpp)
  (define-key c-mode-base-map (kbd "C-c e") 'eassist-list-methods))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;; (defun my-python-mode-hook ()
;;   (define-key python-mode-map (kbd "C-c e") 'eassist-list-methods))
;; (add-hook 'python-mode-hook 'my-python-mode-hook)

;; =================================================
;; Emacs设置
;; =================================================
;; locale coding
(setq locale-coding-system'utf-8)
(prefer-coding-system'utf-8)
(set-keyboard-coding-system'utf-8)
(set-terminal-coding-system'utf-8)
(set-selection-coding-system'utf-8)
(set-clipboard-coding-system 'ctext)
(set-buffer-file-coding-system 'utf-8)
;; no backup file and no auto save file
(setq make-backup-files nil)
(setq auto-save-default nil) 
;; y or n for yes or no
(fset 'yes-or-no-p 'y-or-n-p)
;; space for tab 
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; close menu bar
(menu-bar-mode -1)
;; close native completion
(setq-default completion-auto-help nil)
;; open terminal menu by "M-`"
(setq tty-menu-open-use-tmm t)
;; set line number format
(setq linum-format " %d ")
;;显示列号在状态栏
(setq column-number-mode t)  
;;显示行号在状态栏
(setq line-number-mode t)
;; =================================================
;; 快捷键
;; =================================================
;; window change
;; (global-set-key  (kbd "C-x l") 'windmove-left)
;; (global-set-key  (kbd "C-x r") 'windmove-right)
;; (global-set-key  (kbd "C-x p") 'windmove-up)
;; (global-set-key  (kbd "C-x d") 'windmove-down)
;; line number
(global-set-key  (kbd "M-l") 'linum-mode)
;; gud-break
(global-set-key  (kbd "C-x <SPC>") 'gud-break)

;; redefine grep-find-command
(setq grep-find-command
      "find . -type f '!' -wholename '*/.svn/*' '!' -wholename '*/test/*' '!' -wholename '*/.git/*' '!' -wholename '*.o'  -print0 | xargs -0 grep -nH -e ")
;;(global-set-key (kbd "C-c g") 'grep-find)

;;parentheses settings
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;transient-mark-mode
(setq transient-mark-mode t);

;;(setq compile-command "cd ~/apsara/youchao/indexengine; scons")
(setq compile-command "scons . -U -j 6")
(setq compilation-scroll-output t)

;;compilation settings
(defun my-compile()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))

;;compilation settings
(defun my-compile2()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  ;;(switch-to-buffer-other-window "*compilation*")
  (compile compile-command))

(global-set-key [f6] 'my-compile)
(global-set-key [f5] 'my-compile2)

;;eshell settings
(defun open-eshell-other-buffer()
  "Open eshell in other buffer"
  (interactive)
  (split-window-right)
  (eshell))
(global-set-key (kbd "<f8>") 'open-eshell-other-buffer)
(put 'erase-buffer 'disabled nil)

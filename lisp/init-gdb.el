;;;; init-gdb.el

;;init-gdb
(setq gdb-many-windows 1)
(setq gdb-use-separate-io-buffer nil)
(setq gdb-show-main 1)

;;####=更改GDB多窗口布局=#################################################################################
(defadvice gdb-setup-windows (after setup-gdb-windows activate)
;;  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
;;  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil nil 'left))
        (win2 (split-window nil ( / ( * (window-height) 3) 4)))
        (win3 (split-window nil ( / ( * (window-height) 1) 2))))
    (select-window win2)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (select-window win3)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io))
    ;; (let ((win4 (split-window-right)))
    ;;   (gdb-set-window-buffer (gdb-locals-buffer-name) nil win4))
    (select-window win1)
    (set-window-buffer
     win1
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         (list-buffers-noselect))
       )
     )
    (setq gdb-source-window (selected-window))
    ;; (let ((win5 (split-window nil ( / (* (window-height) 3) 4))))
      ;; (gdb-set-window-buffer (gdb-stack-buffer-name) nil win5))
    (select-window win0)))

(provide 'init-gdb)

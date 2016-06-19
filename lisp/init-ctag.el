;; init ctags
(defun create-ctags (dir-name)
  (interactive "DDirectory: ")
  (message "building project tags")
  (let (setq root dir-name)
    (shell-command (concat "/usr/bin/ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f " root "TAGS " root)))
  (visit-project-tags dir-name)
  (message "tags built successfully"))

(defun visit-project-tags (dir-name)
  (interactive)
  (let ((tags-file (concat dir-name "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))

(provide 'init-ctag)

;; (defun create-tags (dir-name)
;;   "Create tags file."
;;   (interactive "DDirectory: ")
;;   (shell-command
;;    (format "ctags -e -R %s" dir-name))
;;   (visit-tags-table dir-name)
;;   )

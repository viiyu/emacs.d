;;init-utils.el

;; 如果feature A依赖feature B 可写成(after-load 'B 'A) 则在B之前调用A也不会影响启动
;; after-load
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
          '(progn ,@body)))

(provide 'init-utils)

;; init-lisp.el --- Configuration for Common Lisp development

(use-package slime
  :demand t
  :init
  (setq inferior-lisp-program "sbcl"))

(provide 'init-lisp)

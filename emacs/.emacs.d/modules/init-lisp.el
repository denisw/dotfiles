;; init-lisp.el --- Configuration for Common Lisp development

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(provide 'init-lisp)

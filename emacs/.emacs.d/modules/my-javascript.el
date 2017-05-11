;;; my-javascript.el --- JavaScript development setup

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx?\\'"
  :config
  (progn
    (setq js2-basic-offset 2)
    (setq js2-strict-missing-semi-warning nil)
    (setq js2-strict-trailing-comma-warning nil)))

(provide 'my-javascript)

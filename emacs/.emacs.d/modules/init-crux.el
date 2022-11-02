;;; init-crux.el --- Useful interactive commands

;; https://github.com/bbatsov/crux
(use-package crux
  :straight t
  :bind ("C-c o" . crux-open-with))

(provide 'init-crux)

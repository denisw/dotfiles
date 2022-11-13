;;; init-crux.el --- Useful interactive commands

;; https://github.com/bbatsov/crux
(use-package crux
  :straight t
  :bind (("C-c o" . crux-open-with)
         ("C-c I" . crux-find-user-init-file)))

(provide 'init-crux)

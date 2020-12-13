;;; init-programming.el --- General programming configuration

(defun my/prog-mode-hook ()
  (display-line-numbers-mode 1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)

;; https://github.com/jacktasia/dumb-jump
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(provide 'init-programming)

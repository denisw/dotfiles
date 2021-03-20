;;; init-programming.el --- General programming configuration

(defun my/prog-mode-hook ()
  (setq display-fill-column-indicator-column 79)
  (display-fill-column-indicator-mode 1)
  (display-line-numbers-mode 1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)

;; https://github.com/dgutov/diff-hl
(use-package diff-hl
  :straight t
  :config
  (global-diff-hl-mode))

;; https://github.com/jacktasia/dumb-jump
(use-package dumb-jump
  :straight t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(provide 'init-programming)

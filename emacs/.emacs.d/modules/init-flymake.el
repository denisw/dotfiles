;;; init-flymake.el --- Configuration for Flymake

(use-package flymake-collection
  :straight t
  :hook (after-init . flymake-collection-hook-setup)
  :config
  (push '(javascript-mode flymake-collection-eslint) flymake-collection-config))

;; https://github.com/meqif/flymake-diagnostic-at-point
(use-package flymake-diagnostic-at-point
  :straight t
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

(provide 'init-flymake)

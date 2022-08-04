;;; init-flymake.el --- Configuration for Flymake

;; https://github.com/meqif/flymake-diagnostic-at-point
(use-package flymake-diagnostic-at-point
  :straight t
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

(provide 'init-flymake)

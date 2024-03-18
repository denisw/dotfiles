;;; init-envrc.el --- Direnv (.envrc) support

;; https://github.com/purcell/envrc
(use-package envrc
  :ensure t
  :if (executable-find "direnv")
  :bind (("C-c e" . envrc-mode-map))
  :config
  (envrc-global-mode))

(provide 'init-envrc)

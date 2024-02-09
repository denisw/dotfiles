;;; init-ui.el --- Packages for UI tweaks

;; https://github.com/emacsorphanage/popwin
(use-package popwin
  :ensure t
  :config
  (push "*xref*" popwin:special-display-config)
  (popwin-mode))

(provide 'init-ui)

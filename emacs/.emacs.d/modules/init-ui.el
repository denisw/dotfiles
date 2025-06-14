;;; init-ui.el --- Packages for UI tweaks

;; https://github.com/emacsorphanage/popwin
(use-package popwin
  :ensure t
  :config
  (push "*xref*" popwin:special-display-config)
  (popwin-mode))

(use-package ansi-color
  :hook (compilation-filter . ansi-color-compilation-filter))

(provide 'init-ui)

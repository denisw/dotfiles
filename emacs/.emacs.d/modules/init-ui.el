;;; init-ui.el --- Packages for UI tweaks

(use-package popwin
  :straight t
  :config
  (push "*xref*" popwin:special-display-config)
  (popwin-mode))

(provide 'init-ui)

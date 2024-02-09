;;; init-ui.el --- Packages for UI tweaks

(use-package popwin
  :demand t
  :config
  (push "*xref*" popwin:special-display-config)
  (popwin-mode))

(provide 'init-ui)

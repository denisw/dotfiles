;;; init-theme-one.el --- Theme: One

;; https://github.com/balajisivaraman/emacs-one-themes
(use-package one-themes
  :straight t
  :config
  (setq emacs-one-use-variable-pitch nil)
  (setq emacs-one-height-minus-1 1.0)
  (setq emacs-one-height-plus-1 1.0)
  (setq emacs-one-height-plus-2 1.0)
  (setq emacs-one-height-plus-3 1.0)
  (setq emacs-one-height-plus-4 1.0)
  (load-theme 'one-dark t)
  (set-face-foreground 'fill-column-indicator "#EAEAEA"))

(provide 'init-theme-one)

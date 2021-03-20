;;; init-theme-dracula.el --- Theme: Dracula

;; https://draculatheme.com/emacs
(use-package dracula-theme
  :straight t
  :config
  (load-theme 'dracula t)
  (set-face-foreground 'fill-column-indicator "#6272a4"))

(provide 'init-theme-dracula)

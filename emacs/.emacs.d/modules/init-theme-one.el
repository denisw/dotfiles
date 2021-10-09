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

  (load-theme 'one-light t)

  (set-face-foreground 'fill-column-indicator "#EAEAEA")

  (with-eval-after-load "term"
    (set-face-foreground 'term-color-blue "#61AFEF")
    (set-face-foreground 'term-color-red "#E06C75")))

(provide 'init-theme-one)

;;; init-writing.el --- Modes and configuration for prose writing

;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :demand t
  :config
  (setq markdown-enable-wiki-links t))

;; https://codeberg.org/joostkremers/visual-fill-column
(use-package visual-fill-column
  :demand t
  :hook ((markdown-mode . my/enable-visual-fill-column)))

(defun my/enable-visual-fill-column ()
  (setq fill-column 80)
  (visual-line-mode 1)
  (visual-fill-column-mode 1))

;; https://github.com/rnkn/olivetti
(use-package olivetti
  :demand t
  :after visual-fill-column
  :config
  ;; Disable visual-fill-column-mode while Olivetti is enabled.
  ;; The two modes are incompatible.
  ;; https://github.com/rnkn/olivetti/issues/27
  (defun my/before-olivetti-mode (&rest args)
    (visual-fill-column-mode (if (bound-and-true-p olivetti-mode) +1 -1)))
  (advice-add 'olivetti-mode :before #'my/before-olivetti-mode))

(provide 'init-writing)

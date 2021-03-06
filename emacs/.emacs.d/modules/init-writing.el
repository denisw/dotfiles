;;; init-writing.el --- Modes and configuration for prose writing

;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure t
  :config
  (setq markdown-enable-wiki-links t))

;; https://github.com/joostkremers/visual-fill-column
(use-package visual-fill-column
  :ensure t
  :config
  (add-hook 'visual-fill-column-mode-hook #'visual-line-mode))

;; https://github.com/rnkn/olivetti
(use-package olivetti
  :ensure t)

(provide 'init-writing)

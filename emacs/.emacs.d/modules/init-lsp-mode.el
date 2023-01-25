;;; init-lsp-mode.el --- LSP integration using lsp-mode

(use-package lsp-mode
  :ensure t
  :diminish lsp-mode
  :init
  (setq gc-cons-threshold 100000000)
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp
  :hook
  ((js-mode . lsp)
   (typescript-mode . lsp)
   (typescript-tsx-mode . lsp)))

(use-package flycheck
  :ensure t)

(use-package which-key
  :ensure t)

(provide 'init-lsp-mode)

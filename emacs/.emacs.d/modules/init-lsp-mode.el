;;; init-lsp-mode.el --- LSP integration using lsp-mode

(use-package lsp-mode
  :straight t
  :init
  (setq gc-cons-threshold 100000000)
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp
  :hook
  ((js-mode . lsp)
   (typescript-mode . lsp)
   (typescript-tsx-mode . lsp)))

(use-package flycheck
  :straight t)

(use-package which-key
  :straight t)

(provide 'init-lsp-mode)

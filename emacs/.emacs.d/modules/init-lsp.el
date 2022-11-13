;;; init-lsp.el --- Language Server Protocol integration using lsp-mode

(use-package lsp-mode
  :straight t
  :init
  (setq gc-cons-threshold 100000000)
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((javascript-mode . lsp)
   (typescript-mode . lsp)))

(use-package flycheck
  :straight t)

(use-package which-key
  :straight t)

(provide 'init-lsp)

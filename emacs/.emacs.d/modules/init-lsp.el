;;; init-lsp.el --- Configures LSP mode.

(use-package lsp-mode
  :ensure t
  :hook ((js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)))

(provide 'init-lsp)

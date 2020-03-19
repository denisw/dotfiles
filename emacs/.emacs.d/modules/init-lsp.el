;;; init-lsp.el --- Configures LSP mode.

(use-package lsp-mode
  :ensure t
  :hook ((js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred))
  :init
  (setq lsp-signature-render-documentation nil))

(provide 'init-lsp)

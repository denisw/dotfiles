;;; init-lsp.el --- Language Server Protocol integration

(use-package eglot
  :straight t
  :config
  (put 'typescript-tsx-mode 'eglot-language-id "typescriptreact")
  (add-to-list
   'eglot-server-programs
   `(typescript-tsx-mode . ("typescript-language-server" "--stdio"))))

(provide 'init-lsp)

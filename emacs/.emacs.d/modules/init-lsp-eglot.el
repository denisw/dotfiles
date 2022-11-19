;;; init-lsp-eglot.el --- Language Server Protocol integration using Eglot

(use-package eglot
  :straight t
  :after typescript-mode
  :config
  (put 'typescript-tsx-mode 'eglot-language-id "typescriptreact")
  (add-to-list
   'eglot-server-programs
   `(typescript-tsx-mode . ("typescript-language-server" "--stdio"))))

;; TODO:
;; - Add Flymake to eglot-stay-out-of
;; - Add both flymake-collection-eslint and eglot-flymake-backend for JS/TS buffers

(provide 'init-lsp-eglot)

;;; init-lsp.el --- Language Server Protocol integration

(use-package tree-sitter
  :ensure t)

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter
  :hook ((typescript-mode . tree-sitter-hl-mode)
         (typescript-tsx-mode . tree-sitter-hl-mode))
  :config
  (add-to-list
   'tree-sitter-major-mode-language-alist
   '(typescript-tsx-mode . typescript)))

(provide 'init-tree-sitter)

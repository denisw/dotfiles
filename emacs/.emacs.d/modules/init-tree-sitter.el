;;; init-tree-sitter.el --- Syntax highlighting with Tree-Sitter

(use-package tree-sitter
  :straight t
  :hook ((typescript-mode . tree-sitter-hl-mode)
         (typescriptreact-mode . tree-sitter-hl-mode))
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx)))

(use-package tree-sitter-langs
  :straight t
  :after tree-sitter
  :hook ((typescript-mode . tree-sitter-hl-mode)
         (typescript-tsx-mode . tree-sitter-hl-mode))
  :config
  (add-to-list
   'tree-sitter-major-mode-language-alist
   '(typescript-tsx-mode . typescript)))

(provide 'init-tree-sitter)

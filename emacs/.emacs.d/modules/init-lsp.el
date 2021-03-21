;;; init-lsp.el --- Language Server Protocol integration

(use-package lsp-mode
  :straight t
  :init (setq lsp-keymap-prefix "C-c l")
  :commands lsp)

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)

(use-package dap-mode
  :straight t)

(provide 'init-lsp)

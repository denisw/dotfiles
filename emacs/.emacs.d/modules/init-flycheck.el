;;; init-lsp-mode.el --- Syntax checking with Flycheck

(use-package flycheck
  :ensure t
  :defer t
  :diminish flycheck-mode)

(provide 'init-flycheck)

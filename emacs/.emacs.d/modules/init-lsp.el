;;; init-lsp.el --- Configures LSP mode.

(use-package lsp-mode
  :ensure t
  :hook ((typescript-mode . lsp-deferred))
  :init
  (setq lsp-signature-render-documentation nil)

  ;; Enable LSP in js-mode, but not for JSON files
  (add-hook 'js-mode-hook
            (lambda ()
              (unless (equal major-mode "json-mode")
                (lsp-deferred)))))

(provide 'init-lsp)

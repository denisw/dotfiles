;;; init-lsp-mode.el --- LSP integration using lsp-mode

(use-package lsp-mode
  :ensure t
  :diminish lsp-mode
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :commands lsp
  :hook
  ((js-mode . lsp-deferred)
   (typescript-ts-mode . lsp-deferred)
   (tsx-ts-mode . lsp-deferred)))

(defun my/lsp-ui-doc-mode-hook ()
  (evil-local-set-key 'normal (kbd "K") 'lsp-ui-doc-glance))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-position 'at-point)
  :hook
  (lsp-ui-doc-mode . my/lsp-ui-doc-mode-hook))

(provide 'init-lsp-mode)

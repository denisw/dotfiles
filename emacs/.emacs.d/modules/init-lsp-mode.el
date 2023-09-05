;;; init-lsp-mode.el --- LSP integration using lsp-mode

(use-package lsp-mode
  :straight t
  :after which-key
  :commands lsp
  :diminish lsp-mode
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-keymap-prefix "s-l")
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  :config
  (define-key lsp-mode-map (kbd "s-l r f") 'lsp-javascript-rename-file)
  :commands lsp
  :hook
  ((js-ts-mode . lsp-deferred)
   (ruby-mode . lsp-deferred)
   (typescript-web-mode . lsp-deferred)
   (tsx-web-mode . lsp-deferred)
   (typescript-ts-mode . lsp-deferred)
   (rust-mode . lsp-deferred)
   (tsx-ts-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration)))

(defun my/lsp-ui-doc-mode-hook ()
  (evil-local-set-key 'normal (kbd "K") 'lsp-ui-doc-glance))

(use-package lsp-ui
  :straight t
  :init
  (setq lsp-ui-doc-position 'at-point)
  :hook (lsp-ui-doc-mode . my/lsp-ui-doc-mode-hook))

(provide 'init-lsp-mode)

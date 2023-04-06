;;; init-lsp-mode.el --- LSP integration using lsp-mode

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package lsp-mode
  :ensure t
  :after which-key
  :commands lsp
  :diminish lsp-mode
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :commands lsp
  :hook
  ((js-mode . lsp-deferred)
   (ruby-mode . lsp-deferred)
   (typescript-web-mode . lsp-deferred)
   (tsx-web-mode . lsp-deferred)
   (typescript-ts-mode . lsp-deferred)
   (tsx-ts-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration)))

(defun my/lsp-ui-doc-mode-hook ()
  (evil-local-set-key 'normal (kbd "K") 'lsp-ui-doc-glance))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-position 'at-point)
  :hook (lsp-ui-doc-mode . my/lsp-ui-doc-mode-hook))

(provide 'init-lsp-mode)

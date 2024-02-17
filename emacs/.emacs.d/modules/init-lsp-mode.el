;;; init-lsp-mode.el --- LSP integration using lsp-mode

(defun my/lsp-python-mode-hook ()
  (require 'lsp-pyright)
  (lsp-deferred))

(use-package lsp-mode
  :ensure t
  :after which-key
  :commands (lsp lsp-deferred)
  :init
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-keymap-prefix "s-l")
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  :config
  (define-key lsp-mode-map (kbd "s-l r f") 'lsp-javascript-rename-file)
  (define-key lsp-mode-map (kbd "s-.") 'lsp-execute-code-action)
  (define-key lsp-mode-map (kbd "<f2>") 'lsp-rename)
  :commands lsp
  :hook
  ((js-ts-mode . lsp-deferred)
   (python-mode . my/lsp-python-mode-hook)
   (python-ts-mode . my/lsp-python-mode-hook)
   (ruby-mode . lsp-deferred)
   (rust-mode . lsp-deferred)
   (typescript-ts-mode . lsp-deferred)
   (tsx-ts-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration)))

(defun my/lsp-ui-doc-mode-hook ()
  (evil-local-set-key 'normal (kbd "K") 'lsp-ui-doc-glance))

(use-package lsp-ui
  :demand t
  :init
  (setq lsp-ui-doc-position 'at-point)
  :hook (lsp-ui-doc-mode . my/lsp-ui-doc-mode-hook))

(use-package lsp-pyright
  :demand t
  :after lsp-mode)

(provide 'init-lsp-mode)

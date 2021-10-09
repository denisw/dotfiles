;;; init-lsp.el --- Language Server Protocol integration

(use-package lsp-mode
  :straight t
  :init
  (setq lsp-keymap-prefix "C-c l")
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  :commands lsp
  :hook (rust-mode . lsp))

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(provide 'init-lsp)

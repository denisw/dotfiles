;;; my-macos.el --- macOS-specific configuration

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(provide 'my-macos)

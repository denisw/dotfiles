;;; init-macos.el --- macOS-specific configuration

(when (eq system-type 'darwin)
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))

(provide 'init-macos)

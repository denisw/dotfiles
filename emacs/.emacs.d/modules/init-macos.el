;;; init-macos.el --- macOS-specific configuration

;; https://github.com/purcell/exec-path-from-shell
(when (eq window-system 'ns)
  (use-package exec-path-from-shell
    :config
    (setq exec-path-from-shell-check-startup-files nil)
    (exec-path-from-shell-initialize)))

(provide 'init-macos)

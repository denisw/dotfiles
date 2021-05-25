;;; init-macos.el --- macOS-specific configuration

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :if (string-equal system-type "darwin")
  :straight t
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))

;; https://github.com/jwiegley/use-package
(use-package ns-auto-titlebar
  :if (memq window-system '(mac ns))
  :straight t
  :config
  (ns-auto-titlebar-mode))

(provide 'init-macos)

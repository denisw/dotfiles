;;; init-shell.el --- Configutation for shell-mode and shell scripting

(setq-default sh-basic-offset 2)

;; Terminal emulation in shell-mode
;; https://elpa.gnu.org/packages/coterm.html
(use-package coterm
  :ensure t
  :config
  (coterm-mode))

(provide 'init-shell)

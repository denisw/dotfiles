;;; init-company.el --- Company Mode for completion

;; https://company-mode.github.io
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

(provide 'init-company)

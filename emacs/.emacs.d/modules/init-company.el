;;; init-company.el --- Company Mode for completion

;; https://company-mode.github.io
(use-package company
  :ensure t
  :after delight
  :delight company-mode
  :hook (prog-mode . company-mode)
  :init
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

(provide 'init-company)

;;; init-company.el --- Company Mode for completion

;; https://company-mode.github.io
(use-package company
  :ensure t
  :after delight
  :delight company-mode
  :hook (prog-mode . company-mode))

(provide 'init-company)

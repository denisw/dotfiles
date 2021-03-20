;;; init-company.el --- Company Mode for completion

;; https://company-mode.github.io
(use-package company
  :straight t
  :hook (prog-mode . company-mode))

(provide 'init-company)

;;; init-company.el --- Company Mode for completion

;; https://company-mode.github.io
(use-package company
  :demand t
  :after delight
  :delight company-mode
  :hook (prog-mode . company-mode)
  :init
  (setq company-idle-delay 0.1))

(provide 'init-company)

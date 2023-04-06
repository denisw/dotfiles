;;; init-delight.el --- Hide minor modes from the modeline

;; Use delight.el to hide modes from the modeline.
(use-package delight
  :ensure t
  :delight
  auto-revert-mode
  eldoc-mode)

(provide 'init-delight)

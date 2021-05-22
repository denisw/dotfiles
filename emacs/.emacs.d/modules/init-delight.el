;;; init-delight.el --- Hide minor modes from the modeline

;; Use delight.el to hide modes from the modeline.
(use-package delight
  :straight t
  :delight
  auto-revert-mode
  eldoc-mode)
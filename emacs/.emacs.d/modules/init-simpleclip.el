;;; init-simpleclip.el --- Separate clipboard and kill ring

;; https://github.com/rolandwalker/simpleclip
(use-package simpleclip
  :ensure t
  :config
  (simpleclip-mode))

(provide 'init-simpleclip)

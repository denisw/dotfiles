;;; init-ripgrep.el -- Search files with Ripgrep

;; https://github.com/dajva/rg.el
(use-package rg
  :demand t
  :config (rg-enable-default-bindings))

(provide 'init-rg)

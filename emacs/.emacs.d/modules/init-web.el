;;; init-web.el --- Web mode

;; http://web-mode.org
(use-package web-mode
  :ensure t
  :mode (("\\.css\\'" . web-mode)
         ("\\.html\\'" . web-mode)
         ("\\.njk\\'" . web-mode))
  :init
  (setq-default web-mode-markup-indent-offset 2)
  (setq-default web-mode-css-indent-offset 2)
  (setq-default web-mode-code-indent-offset 2))

(provide 'init-web)

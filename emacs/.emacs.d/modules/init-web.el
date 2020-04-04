;;; init-web.el --- Web development

;; Use two-space indentation for markup and CSS.
(setq-default css-indent-offset 2)

(use-package web-mode
  :ensure t
  :mode (("\\.css\\'" . web-mode)
         ("\\.html\\'" . web-mode)
         ("\\.njk\\'" . web-mode))
  :init
  (setq-default web-mode-markup-indent-offset 2)
  (setq-default web-mode-css-indent-offset 2)
  (setq-default web-mode-code-indent-offset 2))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(provide 'init-web)

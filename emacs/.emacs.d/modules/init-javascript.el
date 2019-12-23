;;; init-javascript.el --- JavaScript development

;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :ensure t
  :hook js-mode)

;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :ensure t
  :commands prettier-js-mode
  :hook (js-mode . prettier-js-mode))

;; Set JavaScript tab width
(defun my-js-mode-hook ()
  (setq js-indent-level 2))
(add-hook 'js-mode-hook 'my-js-mode-hook)

(provide 'init-javascript)

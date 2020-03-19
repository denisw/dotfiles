;;; init-javascript.el --- JavaScript / TypeScript development

(setq-default js-indent-level 2)

;; TypeScript
;; https://github.com/emacs-typescript/typescript.el
(use-package typescript-mode
  :ensure t
  :config
  (setq-default typescript-indent-level 2))

;; Put node_modules/.bin into exec path (e.g., for ESLint)
;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :ensure t
  :hook (js-mode typescript-mode))

;; Prettier
;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :ensure t
  :after (add-node-modules-path)
  :commands prettier-js-mode
  :hook ((js-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)))

(provide 'init-javascript)

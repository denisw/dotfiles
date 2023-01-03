;;; init-javascript.el --- JavaScript programming

;; Indent JavaScript with two spaces by default.
(setq-default js-indent-level 2)

;; https://github.com/emacs-typescript/typescript.el
(use-package typescript-mode
  :ensure t
  :after tree-sitter
  :init
  (setq-default typescript-indent-level 2)
  :config
  (define-derived-mode typescriptreact-mode typescript-mode "TypeScript React")
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode)))

;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :ensure t
  :after typescript-mode
  :hook ((js-mode . add-node-modules-path)
         (typescript-mode . add-node-modules-path)))

;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :ensure t
  :after add-node-modules-path
  :commands prettier-js-mode
  :hook ((js-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (typescript-tsx-mode . prettier-js-mode)))

;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)
          ("/\\.eslintrc\\'" . json-mode)
          ("/\\.prettierrc\\'" . json-mode)))

(provide 'init-javascript)

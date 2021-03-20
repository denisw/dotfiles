;;; init-javascript.el --- JavaScript programming

;; Indent JavaScript with two spaces by default.
(setq-default js-indent-level 2)

;; https://github.com/emacs-typescript/typescript.el
(use-package typescript-mode
  :straight t
  :config
  (setq-default typescript-indent-level 2))

;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :straight t
  :hook (js-mode typescript-mode))

;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :straight t
  :after add-node-modules-path
  :commands prettier-js-mode
  :hook ((js-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)))

;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :straight t
  :mode (("\\.json\\'" . json-mode)
          ("/\\.eslintrc\\'" . json-mode)
          ("/\\.prettierrc\\'" . json-mode)))

(provide 'init-javascript)

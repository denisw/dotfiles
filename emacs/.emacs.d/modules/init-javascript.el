;;; init-javascript.el --- JavaScript programming

;; Indent JavaScript with two spaces by default.
(setq-default js-indent-level 2)

;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :ensure t
  :hook ((js-mode . add-node-modules-path)
         (typescript-ts-mode . add-node-modules-path)
         (tsx-ts-mode . add-node-modules-path))
  :config
  (setq add-node-modules-path-command "echo \"$(npm root)/.bin\""))

;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :ensure t
  :after add-node-modules-path
  :commands prettier-js-mode
  :hook ((js-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode)
         (tsx-ts-mode . prettier-js-mode)))

;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)
          ("/\\.eslintrc\\'" . json-mode)
          ("/\\.prettierrc\\'" . json-mode)))

(provide 'init-javascript)

;;; init-javascript-ts.el --- JavaScript/TypeScript programming

;; Indent JavaScript with two spaces by default.
(setq-default js-indent-level 2)

;; Use Tree-Sitter modes for TypeScript.
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

;; Use Tree-Sitter modes for JSON.
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsonl\\'" . json-ts-mode))
(add-to-list 'auto-mode-alist '("/\\.eslintrc\\'" . json-ts-mode))
(add-to-list 'auto-mode-alist '("/\\.prettierrc\\'" . json-ts-mode))

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
  :hook ((js-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode)
         (tsx-ts-mode . prettier-js-mode)))

(provide 'init-javascript-ts)

;;; init-javascript.el --- JavaScript programming

;; Indent JavaScript with two spaces by default.
(setq-default js-indent-level 2)

;; Define TypeScript modes based on web-mode.
(use-package web-mode
  :init
  (define-derived-mode typescript-web-mode web-mode "TypeScript")
  (define-derived-mode tsx-web-mode web-mode "TypeScript(TSX)")
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-web-mode)))

;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :ensure t
  :hook ((js-mode . add-node-modules-path)
         (typescript-web-mode . add-node-modules-path)
         (tsx-web-mode . add-node-modules-path)
         (typescript-ts-mode . add-node-modules-path))
  :config
  (setq add-node-modules-path-command "echo \"$(npm root)/.bin\""))

;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :ensure t
  :hook ((js-mode . prettier-js-mode)
         (typescript-web-mode . prettier-js-mode)
         (tsx-web-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode)
         (tsx-ts-mode . prettier-js-mode)))

;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)
          ("/\\.eslintrc\\'" . json-mode)
          ("/\\.prettierrc\\'" . json-mode)))

(provide 'init-javascript)

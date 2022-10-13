;;; init-evil.el --- Configures Vim keybindings using Evil

;; Install Evil mode for Vim keybindings.
;; https://github.com/emacs-evil/evil
(use-package evil
  :straight t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-shift-width tab-width)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  ;; Make Evil's "word" text object more similar to Vim's
  ;; (e.g., condider underscores as part of a word).
  ;; https://evil.readthedocs.io/en/latest/faq.html#underscore-is-not-a-word-character
  (defalias 'forward-evil-word 'forward-evil-symbol))

;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

;; Add evil-commentary for easily commenting out code.
;; https://github.com/linktohack/evil-commentary
(use-package evil-commentary
  :straight t
  :after (evil delight)
  :delight evil-commentary-mode
  :config
  (evil-commentary-mode))

(provide 'init-evil)

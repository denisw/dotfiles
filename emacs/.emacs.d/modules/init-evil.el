;;; init-evil.el --- Configures Vim keybindings using Evil

;; Install Evil mode for Vim keybindings.
;; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-shift-width tab-width)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  ;; Use <Space> as leader key, Spacemacs-style
  (evil-set-leader 'normal (kbd "SPC"))
  ;; Custom keybindings inspired by Neovim
  (evil-global-set-key 'normal (kbd "]d") 'next-error)
  (evil-global-set-key 'normal (kbd "[d") 'previous-error))

;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

;; Add evil-commentary for easily commenting out code.
;; https://github.com/linktohack/evil-commentary
(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode))

(provide 'init-evil)

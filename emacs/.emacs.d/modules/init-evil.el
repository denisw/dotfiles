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
  ;; Bind C-p to projectile-find-file
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  ;; Bind - to dired-jump, similar to vim-vinegar
  (define-key evil-normal-state-map (kbd "-") 'dired-jump))

;; Use the Evil Collection to integrate Evil into many other modes.
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

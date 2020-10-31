;;; init-evil.el --- Configures Vim keybindings using Evil

;; Install Evil mode for Vim keybindings.
;; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t
  :init
  (setq evil-shift-width tab-width)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  ;; Bind C-u to scroll-up instead of repeat
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  ;; Bind C-p to projectile-find-file
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file))

;; Use the Evil Collection to integrate Evil into many other modes.
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

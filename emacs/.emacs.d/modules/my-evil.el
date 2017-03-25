;;; dw-evil.el --- Use evil-mode for Vim keybindings.

(use-package evil
  :ensure t

  :init
  (evil-mode 1)

  :config
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up))


(use-package evil-leader
  :ensure t

  :init
  (global-evil-leader-mode 1)

  :config
  (progn
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key "f" 'find-file)))

(provide 'my-evil)

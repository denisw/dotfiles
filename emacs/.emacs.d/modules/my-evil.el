;;; dw-evil.el --- Use evil-mode for Vim keybindings.

(use-package evil
  :ensure t
  :init
  (setq-default evil-want-integration nil)
  (setq-default evil-shift-width 2)
  :config
  (progn
    (evil-mode 1)
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-leader
  :ensure t

  :init
  (global-evil-leader-mode 1)

  :config
  (progn
    (evil-leader/set-leader "<SPC>")

    ;; Buffers
    (evil-leader/set-key "b" 'switch-to-buffer)

    ;; Files
    (evil-leader/set-key "f" 'helm-find-files)
    (evil-leader/set-key "k" 'kill-this-buffer)

    ;; M-x
    (evil-leader/set-key ":" 'execute-extended-command)

    ;; Windows
    (evil-leader/set-key "0" 'delete-window)
    (evil-leader/set-key "1" 'delete-other-windows)
    (evil-leader/set-key "2" 'split-window-below)
    (evil-leader/set-key "3" 'split-window-right)
    (evil-leader/set-key "w" 'other-window)))

(provide 'my-evil)

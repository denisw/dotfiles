;;; init-evil.el --- Vim keybindings using evil-mode

;; evil
(use-package evil
  :after evil-leader
  :init
  (setq evil-shift-width 2)
  :config
  (evil-mode 1)

  ;; Bind C-u to scroll-up instead of repeat
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up))

;; Support leader-key commands with evil-leader
(use-package evil-leader
  :config
  (global-evil-leader-mode)

  ;; Use space key as leader key (inspired by Spacemacs :))
  (evil-leader/set-leader "<SPC>")

  ;; Shortcuts -- Buffers
  (evil-leader/set-key
    "b" 'switch-to-buffer
    "k" 'kill-this-buffer)

  ;; Shortcuts -- Files
  (evil-leader/set-key "f" 'find-file)

  ;; Shortcuts -- Magit
  (evil-leader/set-key "g" 'magit-status)

  ;; Shortcuts -- M-x
  (evil-leader/set-key ":" 'execute-extended-command)

  ;; Shortcuts -- Windows
  (evil-leader/set-key "0" 'delete-window)
  (evil-leader/set-key "1" 'delete-other-windows)
  (evil-leader/set-key "2" 'split-window-below)
  (evil-leader/set-key "3" 'split-window-right)
  (evil-leader/set-key "w" 'other-window))

(provide 'init-evil)

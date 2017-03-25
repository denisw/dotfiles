(use-package evil
  :ensure t

  :init
  ;; Load evil on startup.
  (evil-mode 1)

  :config
  ;; Override C-u to scroll up as in Vim.
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up))

(provide 'my-evil)

;;; my-projectile.el --- Use Projectile for project management

(use-package projectile
  :ensure t
  :config (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :config
  (progn
    (helm-projectile-on)
    (evil-leader/set-key "p" 'helm-projectile-find-file)))

(provide 'my-projectile)

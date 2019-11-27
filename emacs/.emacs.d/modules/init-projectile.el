;;; init-projectile.el --- Project management using Projectile

(use-package projectile
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode 1))

(provide 'init-projectile)

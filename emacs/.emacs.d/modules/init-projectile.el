;;; init-projectile.el --- Projectile project system

;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :after ivy
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

(provide 'init-projectile)

;;; init-projectile.el --- Projectile project system

;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :after selectrum
  :config
  (setq projectile-completion-system 'default)
  (projectile-mode))

(provide 'init-projectile)

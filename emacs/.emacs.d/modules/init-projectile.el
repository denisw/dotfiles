;;; init-projectile.el --- Projectile project system

;; https://github.com/bbatsov/projectile
(use-package projectile
  :straight t
  :after selectrum
  :config
  (setq projectile-completion-system 'auto)
  (projectile-mode))

(provide 'init-projectile)

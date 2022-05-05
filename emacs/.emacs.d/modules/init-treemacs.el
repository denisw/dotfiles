;;; init-treemacs.el --- Project file tree

;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :straight t
  :defer t
  :config
  (setq treemacs-no-png-images t)
  (treemacs-project-follow-mode 1))

;; https://github.com/Alexander-Miller/treemacs#treemacs-evil
(use-package treemacs-evil
  :after (treemacs evil)
  :straight t)

;; https://github.com/Alexander-Miller/treemacs#treemacs-projectile
(use-package treemacs-projectile
  :after (treemacs projectile)
  :straight t)

;; https://github.com/Alexander-Miller/treemacs#treemacs-magit
;; (use-package treemacs-magit
;;   :after treemacs magit
;;   :straight t)

(provide 'init-treemacs)

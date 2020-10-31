;;; init-treemacs.el --- Project file tree

;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :defer t)

;; https://github.com/Alexander-Miller/treemacs#treemacs-evil
(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

;; https://github.com/Alexander-Miller/treemacs#treemacs-projectile
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; https://github.com/Alexander-Miller/treemacs#treemacs-magit
;; (use-package treemacs-magit
;;   :after treemacs magit
;;   :ensure t)

(provide 'init-treemacs)

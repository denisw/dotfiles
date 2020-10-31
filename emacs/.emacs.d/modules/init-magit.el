;;; init-magit.el --- Magit Git client

;; https://magit.vc
(use-package magit
  :ensure t)

;; https://github.com/emacs-evil/evil-magit
(use-package evil-magit
  :ensure t
  :after (evil magit))

(provide 'init-magit)

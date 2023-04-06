;;; init-magit.el --- Magit Git client and modes

;; https://github.com/magit/magit
(use-package magit
  :ensure t
  :commands magit-status)

;; https://github.com/magit/git-modes
(use-package git-modes
  :ensure t)

(provide 'init-magit)

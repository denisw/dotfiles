;;; init-magit.el --- Magit Git client and modes

;; https://github.com/magit/magit
(use-package magit
  :straight t
  :commands magit-status)

;; https://github.com/magit/git-modes
(use-package git-modes
  :straight t)

(provide 'init-magit)

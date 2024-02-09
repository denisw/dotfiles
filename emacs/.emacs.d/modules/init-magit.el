;;; init-magit.el --- Magit Git client and modes

;; https://github.com/magit/magit
(use-package magit
  :ensure t
  :commands magit-status)

;; Magit add-on for "forges" like GitHub
;; https://github.com/magit/forge
(use-package forge
  :ensure t
  :defer t
  :after magit)

;; Major modes for Git-related files like .gitignore
;; https://github.com/magit/git-modes
(use-package git-modes
  :ensure t
  :defer t)

(provide 'init-magit)

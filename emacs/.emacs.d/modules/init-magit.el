;;; init-magit.el --- Magit Git client and modes

;; https://github.com/magit/magit
(use-package magit
  :straight t
  :commands magit-status)

;; Magit add-on for "forges" like GitHub
;; https://github.com/magit/forge
(use-package forge
  :straight t
  :after magit)

;; Major modes for Git-related files like .gitignore
;; https://github.com/magit/git-modes
(use-package git-modes
  :straight t)

(provide 'init-magit)

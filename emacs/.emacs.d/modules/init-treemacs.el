;;; init-treemacs.el --- File tree

(use-package treemacs
  :straight t
  :config
  (treemacs-project-follow-mode 1)
  (treemacs-follow-mode 1))

;; (use-package all-the-icons
;;   :straight t
;;   :if (display-graphic-p))

;; (use-package treemacs-all-the-icons
;;   :straight t
;;   :if (display-graphic-p)
;;   :after (treemacs all-the-icons)
;;   :config
;;   (treemacs-load-theme "doom-atom"))

(provide 'init-treemacs)

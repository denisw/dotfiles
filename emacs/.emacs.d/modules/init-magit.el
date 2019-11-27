;;; init-magit.el --- Git version control with magit

(use-package magit)

(use-package evil-magit
  :ensure t
  :after (evil magit))

(provide 'init-magit)

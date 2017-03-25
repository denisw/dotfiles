;;; my-magit.el --- Use the Magit interface to Git

(use-package magit
  :ensure t
  :config (evil-leader/set-key "g" 'magit-status))

(use-package evil-magit
  :ensure t)

(provide 'my-magit)

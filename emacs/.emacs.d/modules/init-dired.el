;;; init-dired.el --- Dired configuration and tools

(use-package dired
  :init
  (setq dired-kill-when-opening-new-dired-buffer t)
  :config
  (add-hook 'dired-mode-hook 'dired-hide-details-mode))

(use-package all-the-icons
  :straight t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :straight t)

(use-package dired-sidebar
  :straight t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-should-follow-file t)
  (setq dired-sidebar-follow-file-idle-delay 0.5)
  (setq dired-sidebar-theme 'icons))

(provide 'init-dired)

;;; init-dired.el --- Dired configuration and tools

(defun my-dired-mode-hook ()
  (dired-hide-details-mode))

(use-package dired
  :init
  (setq dired-kill-when-opening-new-dired-buffer t)
  :config
  (add-hook 'dired-mode-hook 'my-dired-mode-hook))

(use-package dired-sidebar
  :straight t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-should-follow-file t)
  (setq dired-sidebar-follow-file-timer 0.2)
  (setq dired-sidebar-theme 'ascii))

(provide 'init-dired)

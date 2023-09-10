;;; init-dired.el --- Dired configuration and tools

(use-package dired
  :init
  (setq dired-kill-when-opening-new-dired-buffer t)
  :config
  (evil-define-key 'normal 'global (kbd "-") 'dired-jump)
  (add-hook 'dired-mode-hook 'dired-hide-details-mode))

;; Use the Emacs Lisp implementation of `ls' for Dired.
;; It works the same on all platforms and can sort
;; directories before files before files.
(use-package ls-lisp
  :config
  (setq ls-lisp-use-insert-directory-program nil)
  (setq ls-lisp-dirs-first t))

;; Display all-the-icons icons in Dired buffers.
;; https://github.com/domtronn/all-the-icons.el
;; https://github.com/jtbm37/all-the-icons-dired
(use-package all-the-icons
  :straight t
  :if (display-graphic-p))
(use-package all-the-icons-dired
  :straight t
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-sidebar
  :straight t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-should-follow-file t)
  (setq dired-sidebar-follow-file-idle-delay 0.5)
  (setq dired-sidebar-theme 'icons))

(provide 'init-dired)

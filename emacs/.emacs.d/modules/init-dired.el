;;; init-dired.el --- Dired configuration and tools

(use-package dired
  :ensure nil
  :after evil
  :init
  (setq dired-kill-when-opening-new-dired-buffer t)
  :config
  (evil-define-key 'normal 'global (kbd "-") 'dired-jump)
  (add-hook 'dired-mode-hook 'dired-hide-details-mode))

;; Use the Emacs Lisp implementation of `ls' for Dired.
;; It works the same on all platforms and can sort
;; directories before files before files.
(use-package ls-lisp
  :ensure nil
  :config
  (setq ls-lisp-use-insert-directory-program nil)
  (setq ls-lisp-dirs-first t))

;; Display all-the-icons icons in Dired buffers.
;; https://github.com/domtronn/all-the-icons.el
;; https://github.com/jtbm37/all-the-icons-dired
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))
(use-package all-the-icons-dired
  :ensure t
  :if (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

(provide 'init-dired)

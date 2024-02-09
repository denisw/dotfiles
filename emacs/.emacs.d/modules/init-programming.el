;;; init-programming.el --- General programming configuration

;; Apply some customizations to modes deriving from prog-mode.
(defun my/prog-mode-hook ()
  ;; Display line numbers.
  (display-line-numbers-mode 1)
  ;; Do not wrap lines by default.
  (setq truncate-lines t)
  ;; Don't display keywords or names as bold.
  (set-face-bold font-lock-keyword-face nil)
  (set-face-bold font-lock-function-name-face nil)
  (set-face-bold font-lock-variable-name-face nil))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)

;; https://github.com/dgutov/diff-hl
(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  ;; https://github.com/dgutov/diff-hl#magit
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

;; https://github.com/radian-software/apheleia
(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode))

(provide 'init-programming)

;; Reduce UI clutter.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show column number in mode line.
(column-number-mode 1)

;; Use two-space indentation by default.
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace on save.
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Highlight matching parentheses.
(show-paren-mode 1)

;; Only ask "y-or-n" questions, no "yes-or-no" ones.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use the Source Code Pro font
(set-default-font "Source Code Pro 13")

;; Put backup and auto-save files into the system's temp directory.
;; http://www.emacswiki.org/emacs/BackupDirectory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Prefer single spaces after sentences.
(setq sentence-end-double-space nil)

;; Enable electric-pair-mode.
(electric-pair-mode)

;; Bind comment-line to s-/ (e.g. Cmd-/ on macOS).
(global-set-key (kbd "s-/") 'comment-line)

;; Install Solarized theme
(use-package solarized-theme
  :ensure t)

(provide 'my-core)

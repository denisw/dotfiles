;; Reduce UI clutter.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Use two-space indentation by default.
(setq indent-tabs-mode nil)
(setq tab-width 2)

;; Highlight trailing whitespace.
(setq show-trailing-whitespace t)

;; Delete trailing whitespace on save.
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Highlight  characters beyond the 80-characters-per-line limit.
;; http://www.emacswiki.org/emacs/EightyColumnRule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Highlight matching parentheses.
(show-paren-mode 1)

;; Only ask "y-or-n" questions, no "yes-or-no" ones.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Put backup and auto-save files into the system's temp directory.
;; http://www.emacswiki.org/emacs/BackupDirectory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Prefer single spaces after sentences.
(setq sentence-end-double-space nil)

;; Enable electric-pair-mode.
(electric-pair-mode)

(provide 'my-core)

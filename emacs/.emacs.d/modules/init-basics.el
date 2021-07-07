;;; init-basics.el --- Basic configuration

;; Minimize UI clutter.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Show the current column number in the mode line.
(column-number-mode 1)

;; Show current time in modeline
(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)

;; Skip the splash screen and show the scratch buffer instead.
(setq inhibit-splash-screen t)

;; Allow resizing frames based on pixels (rather than character
;; rows and columns) so that maximizing is guaranteed to fill
;; the whole screen.
(setq frame-resize-pixelwise t)

;; Reduce the minimum frame width (in characters) for which
;; `split-window-sensibly' splits the frame horizontally.
(setq split-width-threshold 144)

;; Use the Menlo font if available (i.e., on macOS). Otherwise,
;; try falling back to Source Code Pro.
(let ((fonts (font-family-list)))
  (cond
   ((member "Menlo" fonts)
    (set-frame-font "Menlo-12" nil t))
   ((member "Source Code Pro" fonts)
    (set-frame-font "Source Code Pro-12" nil t))))

;; Default to two-space indentation.
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace on save.
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Format paragraphs to have a single space after each sentence
;; rather than the default of two.
(setq sentence-end-double-space nil)

;; Highlight matching parentheses.
(show-paren-mode 1)

;; Automatically insert matching parentheses.
(electric-pair-mode 1)

;; Set the default directory to the home directory if it is "/",
;; which is the case if Emacs is run as a GUI app on macOS.
(when (equal default-directory "/")
  (setq default-directory "~/"))

;; Replace all "yes or no" questions with "y or n" ones.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Put backup and auto-save files into the system's temp directory.
;; See http://www.emacswiki.org/emacs/BackupDirectory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Define aliases for some completion commands, allowing
;; them to be overridden by other modules.
(defalias 'my/find-file 'find-file)
(defalias 'my/switch-to-buffer 'switch-to-buffer)
(defalias 'my/M-x 'execute-extended-command)
(global-set-key (kbd "C-x C-f") #'my/find-file)
(global-set-key (kbd "C-x b") #'my/switch-to-buffer)
(global-set-key (kbd "M-x") #'my/M-x)

(provide 'init-basics)

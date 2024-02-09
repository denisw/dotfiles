;;; init-basics.el --- Basic configuration

(use-package emacs
  :elpaca nil
  :init
  ;; Show the current column number in the mode line.
  (column-number-mode 1)

  ;; Show current time in modeline
  (setq display-time-format "%H:%M")
  (setq display-time-default-load-average nil)
  (display-time-mode 1)

  ;; Disable cursor blinking.
  (blink-cursor-mode 0)

  ;; Skip the splash screen and show the scratch buffer instead.
  (setq inhibit-splash-screen t)

  ;; Allow resizing frames based on pixels (rather than character
  ;; rows and columns) so that maximizing is guaranteed to fill
  ;; the whole screen.
  (setq frame-resize-pixelwise t)
  (setq window-resize-pixelwise t)

  ;; Reduce the minimum frame width (in characters) for which
  ;; `split-window-sensibly' splits the frame horizontally.
  (setq split-width-threshold 144)

  ;; Use the Menlo font if available (i.e., on macOS). Otherwise,
  ;; try falling back to Source Code Pro.
  (let ((fonts (font-family-list)))
    (cond
     ((member "JetBrains Mono" fonts)
      (set-frame-font "JetBrains Mono-14" nil t))
     ((member "Hack" fonts)
      (set-frame-font "Hack-14" nil t))
     ((member "Menlo" fonts)
      (set-frame-font "Menlo-14" nil t))
     ((member "Source Code Pro" fonts)
      (set-frame-font "Source Code Pro-14" nil t))))

  ;; Default to two-space indentation.
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)

  ;; Add a final newline to a file when saving.
  (setq require-final-newline t)

  ;; Delete trailing whitespace on save.
  (add-hook 'before-save-hook 'whitespace-cleanup)

  ;; Format paragraphs to have a single space after each sentence
  ;; rather than the default of two.
  (setq sentence-end-double-space nil)

  ;; Highlight matching parentheses.
  (show-paren-mode 1)

  ;; Automatically insert matching parentheses.
  (electric-pair-mode 1)

  ;; Truncate lines instead of wrapping. However, when we _do_ wrap (e.g.,
  ;; when `visual-line-mode' is enabled), do so on the word level.
  (setq-default truncate-lines t)
  (setq-default truncate-partial-width-windows nil)
  (setq-default word-wrap t)

  ;; Set the default directory to the home directory if it is "/",
  ;; which is the case if Emacs is run as a GUI app on macOS.
  (when (equal default-directory "/")
    (setq default-directory "~/"))

  ;; Replace all "yes or no" questions with "y or n" ones.
  (setq use-short-answers t)

  ;; Put backup and auto-save files into the system's temp directory.
  ;; See http://www.emacswiki.org/emacs/BackupDirectory
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

  ;; Disable the creation of interlock files (.#*).
  ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Interlocking.html
  (setq create-lockfiles nil)

  ;; Define aliases for some completion commands, allowing
  ;; them to be overridden by other modules.
  (defalias 'my/find-file 'find-file)
  (defalias 'my/switch-to-buffer 'switch-to-buffer)
  (defalias 'my/M-x 'execute-extended-command)
  (global-set-key (kbd "C-x C-f") #'my/find-file)
  (global-set-key (kbd "C-x b") #'my/switch-to-buffer)
  (global-set-key (kbd "M-x") #'my/M-x)

  ;; Let Cmd-+/- scale all text, not just the current buffer.
  (global-set-key (kbd "s-=") 'global-text-scale-adjust)
  (global-set-key (kbd "s-+") 'global-text-scale-adjust)
  (global-set-key (kbd "s--") 'global-text-scale-adjust)

  ;; Set first day of calendar to Monday
  (setq calendar-week-start-day 1))

(provide 'init-basics)

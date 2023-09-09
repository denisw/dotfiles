;;; init-shell.el --- Configuration for shell-mode and shell scripting

;; Use two-space indent in shell scripts.
(setq-default sh-basic-offset 2)

;; Terminal emulation in shell-mode
;; https://elpa.gnu.org/packages/coterm.html
(use-package coterm
  :straight t
  :config
  (coterm-mode)
  (setq-default comint-process-echoes t))

(use-package eat
  :after evil
  :straight (eat :type git
                 :host codeberg
                 :repo "akib/emacs-eat"
                 :files ("*.el" ("term" "term/*.el") "*.texi"
                         "*.ti" ("terminfo/e" "terminfo/e/*")
                         ("terminfo/65" "terminfo/65/*")
                         ("integration" "integration/*")
                         (:exclude ".dir-locals.el" "*-tests.el")))
  :init
  (evil-set-initial-state 'eat-mode 'emacs))

(provide 'init-shell)

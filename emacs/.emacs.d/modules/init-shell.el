;;; init-shell.el --- Configuration for shell-mode and shell scripting

;; Use two-space indent in shell scripts.
(setq-default sh-basic-offset 2)

;; Use sh-mode for .env files.
(add-to-list 'auto-mode-alist '("\\.env\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . sh-mode))

;; Terminal emulation in shell-mode
;; https://elpa.gnu.org/packages/coterm.html
(use-package coterm
  :ensure t
  :config
  (coterm-mode)
  (setq-default comint-process-echoes t))


;; Fast alternative to term.el
;; https://codeberg.org/akib/emacs-eat
(use-package eat
  :bind (("C-x p s" . 'eat-project))
  :config
  ;; Make Backspace work as intended on macOS.
  ;; https://codeberg.org/akib/emacs-eat/issues/116
  (when (eq system-type 'darwin)
    (define-key eat-semi-char-mode-map (kbd "C-h")  #'eat-self-input)
    (define-key eat-semi-char-mode-map (kbd "<backspace>") (kbd "C-h"))))

(provide 'init-shell)

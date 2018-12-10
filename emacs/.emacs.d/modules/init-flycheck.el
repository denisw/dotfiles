;;; init-flycheck.el -- Syntax checking with flycheck

(use-package flycheck
  :init
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp-checkdoc
                  javascript-jshint))
  :config
  (global-flycheck-mode 1))

(provide 'init-flycheck)

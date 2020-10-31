;;; init-flycheck.el --- Flycheck for syntax checking

;; https://www.flycheck.org
(use-package flycheck
  :ensure t
  :config
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp-checkdoc
                  javascript-jshint))
  (global-flycheck-mode 1))

(provide 'init-flycheck)

;;; init-flycheck.el --- Flycheck for syntax checking

;; https://www.flycheck.org
(use-package flycheck
  :straight t
  :after delight
  :delight flycheck-mode
  :config
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp-checkdoc
                  javascript-jshint
                  python-mypy))
  (global-flycheck-mode 1))

(provide 'init-flycheck)

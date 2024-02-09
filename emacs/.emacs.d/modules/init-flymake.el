;;; init-flymake.el --- Configuration for Flymake

(setq my/flymake-collection-overrides
      '((javascript-mode flymake-collection-eslint)
        (python-mode flymake-collection-pycodestyle)))

(use-package flymake-collection
  :ensure t
  :config
  (dolist (override my/flymake-collection-overrides)
    (push my/flymake-collection-overrides flymake-collection-config))
  (flymake-collection-hook-setup))

;; https://github.com/meqif/flymake-diagnostic-at-point
(use-package flymake-diagnostic-at-point
  :ensure t
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

(provide 'init-flymake)

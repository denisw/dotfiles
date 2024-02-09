;;; init-eglot.el --- LSP integration using Eglot

(defun my/setup-typescript-tsx-mode ()
  )

(defun my/eglot-managed-mode-hook ()
  (evil-global-set-key 'normal "K" 'eldoc-box-help-at-point)
  ;; Add the configured flymake-collection checkers on top of
  ;; eglot-flymake-backend.
  (let* ((entry (assoc major-mode flymake-collection-config))
         (checkers (cdr entry)))
    (dolist (c checkers)
      (push c flymake-diagnostic-functions))))

(use-package eglot
  :ensure t
  :after (flymake-collection typescript-mode)
  :hook ((eglot-managed-mode . my/eglot-managed-mode-hook)))

(use-package eldoc
  :defer t
  :config
  (setq eldoc-echo-area-use-multiline-p 1))

(provide 'init-eglot)

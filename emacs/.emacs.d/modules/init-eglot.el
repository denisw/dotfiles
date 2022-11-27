;;; init-eglot.el --- LSP integration using Eglot

(defun my/setup-typescript-tsx-mode ()
  (let* ((command '("typescript-language-server" "--stdio"))
         (association `(typescript-tsx-mode . ,command)))
    (put 'typescript-tsx-mode 'eglot-language-id "typescriptreact")
    (add-to-list 'eglot-server-programs association)))

(defun my/eglot-managed-mode-hook ()
  ;; Add the configured flymake-collection checkers on top of
  ;; eglot-flymake-backend.
  (let* ((entry (assoc major-mode flymake-collection-config))
         (checkers (cdr entry)))
    (dolist (c checkers)
      (push c flymake-diagnostic-functions))))

(use-package eglot
  :straight t
  :after (flymake-collection typescript-mode)
  :hook
  ((eglot-managed-mode . my/eglot-managed-mode-hook))
  :config
  (my/setup-typescript-tsx-mode))

(provide 'init-eglot)

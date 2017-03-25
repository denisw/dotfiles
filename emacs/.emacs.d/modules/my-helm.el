;;; my-helm.el --- Use Helm for nicer minibuffer experience

(use-package helm
  :ensure t

  :config
  (progn
    (require 'helm-config)
    (helm-mode 1)

    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-find-files-map (kbd "C-h") 'helm-find-files-up-one-level)))

(provide 'my-helm)

;;; init-helm.el --- Helm completion

;; https://emacs-helm.github.io/helm/
(use-package helm
  :straight t
  :after hydra
  :config
  (helm-mode 1)

  (defalias 'my/M-x 'helm-M-x)
  (defalias 'my/find-file 'helm-find-files)
  (defalias 'my/switch-to-buffer 'helm-buffers-list)

  (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") #'helm-select-action))


(provide 'init-helm)

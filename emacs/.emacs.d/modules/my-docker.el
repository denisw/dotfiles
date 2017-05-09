;;; my-docker.el --- Dockerfile syntax highlighting

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")

(use-package cider
  :ensure t)

(provide 'my-docker)

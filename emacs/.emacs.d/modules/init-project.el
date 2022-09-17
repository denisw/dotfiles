;; init-project.el -- project.el configuration

(use-package project
  :config
  (evil-define-key 'normal 'global (kbd "C-p") 'project-find-file))

(provide 'init-project)

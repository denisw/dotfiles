;; init-project.el -- project.el configuration

(use-package project
  :after evil
  :config
  (evil-define-key 'normal 'global (kbd "C-p") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "s-p") 'project-find-file))

(provide 'init-project)

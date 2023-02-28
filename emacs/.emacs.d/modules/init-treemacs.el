;;; init-treemacs.el --- File tree

(use-package treemacs
  :straight t
  :config
  (treemacs-project-follow-mode 1)
  (treemacs-follow-mode 1)
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "C-x t t") 'treemacs))

(provide 'init-treemacs)

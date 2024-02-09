;;; init-treemacs.el --- File tree

(use-package treemacs
  :demand t
  :config
  (treemacs-project-follow-mode 1)
  (treemacs-follow-mode 1)
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "C-x t t") 'treemacs)
  ;; Don't display the root directory larger than the others.
  (set-face-attribute 'treemacs-root-face nil :height 'unspecified))

(provide 'init-treemacs)

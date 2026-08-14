;;; init-yaml.el --- YAML mode  -*- lexical-binding: t; -*-

(use-package yaml-mode
  :ensure t
  :defer t
  :hook (yaml-mode . my/prog-mode-hook))

(provide 'init-yaml)

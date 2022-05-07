;;; init-themes.el --- Theme configuration

;; https://github.com/doomemacs/themes
(use-package doom-themes
  :straight t
  :config
  (setq doom-themes-enable-bold nil)
  (setq doom-themes-enable-italic nil))

;; https://github.com/hlissner/emacs-solaire-mode
(use-package solaire-mode
  :straight t
  :config
  (solaire-global-mode 1))

(provide 'init-themes)

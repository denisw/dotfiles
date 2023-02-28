;;; init-themes.el --- Theme configuration

;; https://github.com/doomemacs/themes
(use-package doom-themes
  :straight t
  :after treemacs
  :config
  (setq doom-themes-enable-bold nil)
  (setq doom-themes-enable-italic nil)
  (doom-themes-org-config)
  (doom-themes-treemacs-config)
  (treemacs-load-theme "doom-colors"))

;; https://protesilaos.com/emacs/modus-themes
(use-package modus-themes
  :init
  (setq modus-themes-bold-constructs nil)
  :straight t)

;; https://protesilaos.com/emacs/ef-themes
(use-package ef-themes
  :straight t)

;; https://github.com/hlissner/emacs-solaire-mode
(use-package solaire-mode
  :straight t
  :config
  (solaire-global-mode 1))

(provide 'init-themes)

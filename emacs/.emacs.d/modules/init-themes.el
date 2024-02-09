;;; init-themes.el --- Theme configuration

;; https://github.com/doomemacs/themes
(use-package doom-themes
  :demand t
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
  :demand t)

;; https://protesilaos.com/emacs/ef-themes
(use-package ef-themes
  :demand t)

;; https://github.com/hlissner/emacs-solaire-mode
(use-package solaire-mode
  :demand t
  :config
  (solaire-global-mode 1)
  (push '(treemacs-window-background-face . solaire-default-face) solaire-mode-remap-alist)
  (push '(treemacs-hl-line-face . solaire-hl-line-face) solaire-mode-remap-alist))

(provide 'init-themes)

;;; init-themes.el --- Theme configuration

;; Introduce commands to switch to a default light and dark theme.
;; Use the Modus themes for this, which are built into Emacs nowadays.

(setq my/default-light-theme 'modus-operandi)
(setq my/default-dark-theme 'modus-vivendi)

(defun my/light-theme ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme my/default-light-theme t))

(defun my/dark-theme ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme my/default-dark-theme t))

;; When using emacs-plus on macOS, switch between the light and dark
;; theme automatically based on the macOS system appearance.
;; https://github.com/d12frosted/homebrew-emacs-plus#system-appearance-change
(defun my/apply-theme (appearance)
  (pcase appearance
    ('light (my/light-theme))
    ('dark (my/dark-theme))))
(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

;; https://github.com/doomemacs/themes
(use-package doom-themes
  :ensure t
  :defer t
  :after treemacs
  :config
  (setq doom-themes-enable-bold nil)
  (setq doom-themes-enable-italic nil)
  (doom-themes-org-config)
  (doom-themes-treemacs-config)
  (treemacs-load-theme "doom-colors"))

;; https://protesilaos.com/emacs/modus-themes
(setq modus-themes-bold-constructs nil)
;; (use-package modus-themes
;;   :ensure nil
;;   :init
;;   (setq modus-themes-bold-constructs nil))

;; https://protesilaos.com/emacs/ef-themes
(use-package ef-themes
  :ensure t)

;; https://github.com/hlissner/emacs-solaire-mode
(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode 1)
  (push '(treemacs-window-background-face . solaire-default-face) solaire-mode-remap-alist)
  (push '(treemacs-hl-line-face . solaire-hl-line-face) solaire-mode-remap-alist))

(provide 'init-themes)

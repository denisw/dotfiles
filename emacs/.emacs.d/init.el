;;; init.el --- My Emacs configuration
;;
;; Author: Denis Washington <denis@denisw.de>
;; URL: https://github.com/denisw/dotfiles
;;
;; A relatively small, written-from-scratch Emacs config that makes
;; heavy use of `use-package' for declarative package management
;; and configuration. It configures Vim-style keybindings for as
;; many modes as possible using Evil.
;;
;; The configuration is organized into several modules that can be
;; found in the `modules/' sub-directory.

(add-to-list 'load-path "~/.emacs.d/modules")

;; Ensure that use-package is installed. It is used by the
;; modules to install any required packages.
;;
;; https://github.com/jwiegley/use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Basics
(require 'init-basics)
(require 'init-evil)

;; Theme
(require 'init-theme-one)

;; Utilities
(require 'init-flycheck)
(require 'init-hydra)
(require 'init-ivy)
(require 'init-magit)
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-writing)

;; Languages
(require 'init-docker)
(require 'init-javascript)
(require 'init-programming)
(require 'init-rust)
(require 'init-web)
(require 'init-yaml)

;; Platform-Specific
(when (string-equal system-type "darwin")
  (require 'init-macos))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs-magit zenburn-theme yaml-mode web-mode visual-fill-column use-package undo-tree typescript-mode treemacs-projectile treemacs-evil solarized-theme racket-mode prettier-js org-roam one-themes olivetti nlinum monokai-theme lsp-mode json-mode hlinum go-mode flycheck exec-path-from-shell evil-magit evil-leader evil-commentary evil-collection elpy doom-themes dockerfile-mode deft counsel alchemist ag add-node-modules-path)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

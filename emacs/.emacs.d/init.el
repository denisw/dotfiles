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
(require 'init-theme-dracula)

;; Utilities
(require 'init-flycheck)
(require 'init-hydra)
(require 'init-magit)
(require 'init-projectile)
(require 'init-selectrum)
(require 'init-treemacs)
(require 'init-writing)

;; Languages
(require 'init-c)
(require 'init-clojure)
(require 'init-docker)
(require 'init-javascript)
(require 'init-programming)
(require 'init-rust)
(require 'init-web)
(require 'init-yaml)

;; Platform-Specific
(when (string-equal system-type "darwin")
  (require 'init-macos))

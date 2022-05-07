;;; init.el --- My Emacs configuration
;;
;; Author: Denis Washington <denis@denisw.de>
;; URL: https://github.com/denisw/dotfiles
;
;; A relatively small, written-from-scratch Emacs config that:
;;
;; - Uses `straight.el' and `use-package' for package management
;; - Configures Vim keybindings using `evil'
;;
;; The configuration is organized into several modules that can be
;; found in the `modules/' sub-directory.

;; Bootstrap straight.el for package management.
;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (setq straight-check-for-modifications '(check-on-save find-when-checking))
  (load bootstrap-file nil 'nomessage))

;; Install use-package.
;; https://github.com/jwiegley/use-package
;; https://github.com/raxod502/straight.el#integration-with-use-package
(straight-use-package 'use-package)

;; Add my module directory to the load path.
(add-to-list 'load-path "~/.emacs.d/modules")

;; Basics
(require 'init-basics)
(require 'init-macos)
(require 'init-simpleclip)

;; Evil (Vim bindings)
(require 'init-evil)

;; Theme
(require 'init-theme-dracula)
;; (require 'init-theme-nord)
;; (require 'init-theme-one)

;; Utilities
(require 'init-company)
(require 'init-delight)
(require 'init-elixir)
;; (require 'init-flycheck)
(require 'init-hydra)
(require 'init-java)
(require 'init-lisp)
(require 'init-lsp)
(require 'init-magit)
(require 'init-neotree)
(require 'init-projectile)
(require 'init-python)
(require 'init-rg)
(require 'init-vertico)
(require 'init-writing)

;; Languages
(require 'init-c)
(require 'init-clojure)
(require 'init-docker)
(require 'init-fsharp)
(require 'init-javascript)
(require 'init-lsp)
(require 'init-programming)
(require 'init-rust)
(require 'init-shell)
(require 'init-terraform)
(require 'init-web)
(require 'init-yaml)

;;; init.el --- My Emacs configuration
;;
;; Author: Denis Washington <denis@denisw.de>
;; URL: https://github.com/denisw/dotfiles
;
;; A relatively small, written-from-scratch Emacs config that:
;;
;; - Uses `package.el' and `use-package' for package management
;; - Configures Vim keybindings using `evil'
;;
;; The configuration is organized into several modules that can be
;; found in the `modules/' sub-directory.

;; Silence warnings arising from async native compilation.
(setq native-comp-async-report-warnings-errors 'silent)

;; Use the MELPA package repository.
;; https://elpa.gnu.org
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Add my module directory to the load path.
(add-to-list 'load-path "~/.emacs.d/modules")

;; Basics
(require 'init-basics)
(require 'init-macos)
(require 'init-simpleclip)

;; Evil (Vim bindings)
(require 'init-evil)

;; Theme
(require 'init-themes)

;; Utilities
(require 'init-company)
(require 'init-completion)
(require 'init-crux)
(require 'init-delight)
(require 'init-diminish)
(require 'init-dired)
(require 'init-flycheck)
(require 'init-lsp-mode)
(require 'init-magit)
(require 'init-project)
(require 'init-rg)
(require 'init-treemacs)
(require 'init-writing)
(require 'init-which-key)

;; Languages
(require 'init-c)
(require 'init-clojure)
(require 'init-docker)
(require 'init-elixir)
(require 'init-fsharp)
(require 'init-go)
(if (>= emacs-major-version 29)
  (require 'init-javascript-ts)
  (require 'init-javascript))
(require 'init-lisp)
(require 'init-programming)
(require 'init-python)
(require 'init-rust)
(require 'init-shell)
(require 'init-terraform)
(when (>= emacs-major-version 29)
  (require 'init-treesit))
(require 'init-web)
(require 'init-yaml)

;; (Disabled)
;; (require 'init-eglot)
;; (require 'init-eldoc)
;; (require 'init-flymake)
;; (require 'init-tree-sitter)

;; Put custom variables into a separate file.
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

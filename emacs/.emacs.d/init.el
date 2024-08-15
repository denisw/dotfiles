;;; init.el --- My Emacs configuration
;;
;; Author: Denis Washington <denis@denisw.de>
;; URL: https://github.com/denisw/dotfiles
;;
;; A relatively small, written-from-scratch Emacs config that:
;;
;; - manages packages with `use-package'
;; - configures Vim keybindings with `evil'
;; - uses `lsp-mode' for IDE-like programming features
;;
;; The configuration is organized into several modules that can be
;; found in the `modules/' sub-directory.

;; Silence warnings arising from async native compilation.
(setq native-comp-async-report-warnings-errors 'silent)

;; Add MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Add my module directory to the load path.
(add-to-list 'load-path "~/.emacs.d/modules")

;; Basics
(require 'init-basics)
(require 'init-macos)
(require 'init-simpleclip)
(require 'init-ui)

;; Evil (Vim bindings)
(require 'init-evil)

;; Theme
(require 'init-themes)

;; Utilities
(require 'init-company)
(require 'init-completion)
(require 'init-crux)
(require 'init-envrc)
(require 'init-modeline)
(require 'init-dired)
(require 'init-flycheck)
(require 'init-magit)
(require 'init-project)
(require 'init-rg)
(require 'init-treemacs)
(require 'init-writing)
(require 'init-which-key)

;; Languages & Platforms
(require 'init-azure)
(require 'init-c)
(require 'init-clojure)
(require 'init-docker)
(require 'init-elixir)
(require 'init-fsharp)
(require 'init-go)
(require 'init-javascript)
(require 'init-lisp)
(require 'init-lsp-mode)
(require 'init-programming)
(require 'init-python)
(require 'init-racket)
(require 'init-rust)
(require 'init-shell)
(require 'init-terraform)
(require 'init-treesit)
(require 'init-web)
(require 'init-yaml)

;; (Disabled)
;; (require 'init-eglot)
;; (require 'init-eldoc)
;; (require 'init-flymake)

;; Put custom variables into a separate file.
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

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

;; Silence warnings arising from async native compilation.
(setq native-comp-async-report-warnings-errors 'silent)

;; Install straight.el.
;; https://github.com/radian-software/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

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
(require 'init-modeline)
(require 'init-dired)
(require 'init-eldoc)
(require 'init-flycheck)
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
(require 'init-lsp-mode)
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
;; (require 'init-flymake)
;; (require 'init-tree-sitter)

;; Put custom variables into a separate file.
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; Package manager

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Vendored packages

(add-to-list 'load-path (expand-file-name "~/.emacs.d/3rdparty"))

;; Modules

(add-to-list 'load-path "~/.emacs.d/modules")

(when (eq system-type 'darwin)
  (require 'my-macos))

(require 'my-clojure)
(require 'my-core)
(require 'my-docker)
(require 'my-evil)
(require 'my-haskell)
(require 'my-helm)
(require 'my-javascript)
(require 'my-magit)
(require 'my-projectile)
(require 'my-writing)
(require 'my-yaml)

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("f0c98535db38af17e81e491a77251e198241346306a90c25eb982b57e687d7c0" default)))
 '(package-selected-packages
   (quote
    (zenburn-theme yaml-mode vue-mode use-package solarized-theme scss-mode rjsx-mode olivetti monokai-theme markdown-mode leuven-theme ledger-mode inf-clojure hledger-mode helm-projectile haskell-mode exec-path-from-shell evil-magit evil-leader evil-collection ensime dockerfile-mode diminish cider auctex alchemist adoc-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

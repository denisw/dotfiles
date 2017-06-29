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
(require 'my-markdown)
(require 'my-projectile)
(require 'my-yaml)

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (haskell-mode livedown livedown-mode markdown-mode yaml-mode dockerfile-mode rjsx-mode exec-path-from-shell cider clojure-mode helm-projectile evil-magit magit helm evil-leader projectile evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

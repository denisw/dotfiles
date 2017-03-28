;; Package manager

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Modules

(add-to-list 'load-path "~/.emacs.d/modules")

(when (eq system-type 'darwin)
  (require 'my-macos))

(require 'my-clojure)
(require 'my-core)
(require 'my-evil)
(require 'my-helm)
(require 'my-javascript)
(require 'my-magit)
(require 'my-projectile)

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rjsx-mode exec-path-from-shell cider clojure-mode helm-projectile evil-magit magit helm evil-leader projectile evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
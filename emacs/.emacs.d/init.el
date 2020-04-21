(require 'package)

;; Initialize package.el with MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Initialize use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Allow require from ~/.emacs.d/modules
(add-to-list 'load-path "~/.emacs.d/modules/")

;; Load modules
(require 'init-basic)
(require 'init-docker)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-ivy)
(require 'init-javascript)
(require 'init-lsp)
(require 'init-python)
(require 'init-macos)
(require 'init-magit)
(require 'init-projectile)
(require 'init-theme-zenburn)
(require 'init-web)
(require 'init-writing)
(require 'init-yaml)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode web-mode go-mode elpy typescript-mode lsp-mode prettier-js add-node-modules-path writeroom-mode monokai-theme evil-commentary evil-magit zenburn-theme use-package evil-collection yaml-mode flycheck evil-leader magit molokai-theme solarized-theme markdown-mode projectile ivy evil rjsx-mode req-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

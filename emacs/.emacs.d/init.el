(let ((config-org (expand-file-name "config.org" user-emacs-directory)))
  (org-babel-load-file config-org))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/dotfiles/emacs/.emacs.d/config.org"))
 '(package-selected-packages
   '(one-themes ag counsel deft org-roam treemacs-projectile treemacs-evil treemacs yaml zenburn-theme yaml-mode web-mode use-package typescript-mode solarized-theme projectile prettier-js olivetti nlinum monokai-theme lsp-mode json-mode ivy hlinum go-mode flycheck exec-path-from-shell evil-magit evil-leader evil-commentary evil-collection elpy doom-themes dockerfile-mode alchemist add-node-modules-path)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

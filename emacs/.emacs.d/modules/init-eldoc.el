;;; init-eldoc.el --- Configuration for Eldoc

(use-package eldoc
  :diminish eldoc-mode
  :init
  ;; Limit echo area size to a single line.
  ;; Prevents long eldoc strings from covering half of the window.
  (setq max-mini-window-height 1))

(use-package eldoc-box
  :ensure t
  :after evil-collection
  :config
  (add-to-list 'evil-collection-key-blacklist "K")
  (define-key evil-normal-state-map (kbd "K") 'eldoc-box-help-at-point))

(provide 'init-eldoc)

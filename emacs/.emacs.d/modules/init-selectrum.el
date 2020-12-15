;;; init-selectrum.el --- Selectrum minibuffer completion

;; https://github.com/raxod502/selectrum
(use-package selectrum
  :ensure t
  :config
  (selectrum-mode 1))

;; https://github.com/raxod502/prescient.el
(use-package selectrum-prescient
  :ensure t
  :after selectrum
  :config
  (selectrum-prescient-mode 1)
  (prescient-persist-mode 1))

(provide 'init-selectrum)

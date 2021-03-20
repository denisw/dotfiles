;;; init-selectrum.el --- Selectrum minibuffer completion

;; https://github.com/raxod502/selectrum
(use-package selectrum
  :straight t
  :config
  (selectrum-mode 1)
  (define-key selectrum-minibuffer-map (kbd "s-<backspace>") 'backward-kill-sexp))

;; https://github.com/raxod502/prescient.el
(use-package selectrum-prescient
  :straight t
  :after selectrum
  :config
  (selectrum-prescient-mode 1)
  (prescient-persist-mode 1))

(provide 'init-selectrum)

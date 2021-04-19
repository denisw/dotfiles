;;; init-ivy.el --- Ivy completion

;; https://github.com/abo-abo/swiper#ivy
(use-package ivy
  :straight t
  :after hydra
  :config
  (ivy-mode))

;; https://github.com/abo-abo/swiper#counsel
(use-package counsel
  :straight t
  :after ivy
  :config
  (counsel-mode)
  (defalias 'my/M-x 'counsel-M-x)
  (defalias 'my/find-file 'counsel-find-file)
  (defalias 'my/switch-to-buffer 'counsel-switch-buffer))

;; https://github.com/raxod502/prescient.el
(use-package ivy-prescient
  :straight t
  :after counsel)

(provide 'init-ivy)

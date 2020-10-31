;;; init-ivy.el --- Ivy minibuffer completion

;; https://github.com/abo-abo/swiper
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

;; https://github.com/abo-abo/swiper#counsel
(use-package counsel
  :ensure t)

(provide 'init-ivy)

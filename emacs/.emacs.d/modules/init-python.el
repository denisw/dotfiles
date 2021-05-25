;;; init-python.el --- Python programming

;; https://github.com/pythonic-emacs/anaconda-mode
(use-package anaconda-mode
  :straight t
  :hook python-mode)

;; https://github.com/pythonic-emacs/anaconda-mode
(use-package pipenv
  :straight t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

;; https://github.com/galaunay/poetry.el
(use-package poetry
  :straight t)

(provide 'init-python)

;;; init-python.el --- Python programming

;; https://github.com/pythonic-emacs/anaconda-mode
(use-package anaconda-mode
  :demand t
  :hook python-mode)

;; https://github.com/pythonic-emacs/anaconda-mode
(use-package pipenv
  :demand t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

;; https://github.com/galaunay/poetry.el
(use-package poetry
  :demand t)

(provide 'init-python)

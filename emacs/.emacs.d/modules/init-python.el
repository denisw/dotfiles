;;; init-python.el --- Python programming

;; https://github.com/pythonic-emacs/anaconda-mode
(use-package anaconda-mode
  :ensure t
  :hook (python-mode python-ts-mode))

(use-package pyvenv
  :ensure t)

(provide 'init-python)

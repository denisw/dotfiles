;;; init-programming.el --- prog-mode customizations

(defun my/prog-mode-hook ()
  (display-line-numbers-mode 1))

(add-hook 'prog-mode-hook 'my/prog-mode-hook)

(provide 'init-programming)

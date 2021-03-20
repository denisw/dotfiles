;;; init-c.el --- C/C++ programming

(defun my/c-style-hook ()
  ;; Indent with two spaces by default.
  (setq c-basic-offset 2)
  ;; Do not indent code inside of namespace declarations.
  (c-set-offset 'innamespace 0))

(add-hook 'c-mode-hook 'my/c-style-hook)
(add-hook 'c++-mode-hook 'my/c-style-hook)

;; Major mode for CMake build files.
;; https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
(use-package cmake-mode
  :straight t)

;; Major mode for Meson build files.
;; https://github.com/wentasah/meson-mode
(use-package meson-mode
  :straight t
  :after evil)

(provide 'init-c)

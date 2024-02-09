;;; init-c.el --- C/C++ programming

;; Indent C++ with four spaces by default.
(setq-default c-basic-offset 4)

(defun my/c-style-hook ()
  ;; Use the Stroustrup style by default.
  (c-set-style "stroustrup")
  ;; Do not indent code inside of namespace declarations.
  (c-set-offset 'innamespace 0))

(add-hook 'c-mode-hook 'my/c-style-hook)
(add-hook 'c++-mode-hook 'my/c-style-hook)

;; Major mode for CMake build files.
;; https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
(use-package cmake-mode
  :ensure t
  :defer t)

;; Major mode for Meson build files.
;; https://github.com/wentasah/meson-mode
(use-package meson-mode
  :ensure t
  :defer t)

(provide 'init-c)

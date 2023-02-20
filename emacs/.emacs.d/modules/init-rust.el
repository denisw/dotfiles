;;; init-rust.el --- Rust programming

(defun my-rust-hook ()
  ;; Set tab-width as it is used by eglot-format.
  ;; (rust-mode itself uses rust-indent-offset instead.)
  (setq tab-width 4))

(use-package rust-mode
  :straight t
  :hook (rust-mode . my-rust-hook))

(provide 'init-rust)

;;; init-rust.el --- Rust programming

(use-package rust-mode
  :straight t)

(use-package flycheck-rust
  :straight t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)

;;; init-rust.el --- Rust programming

(use-package rust-mode
  :ensure t)

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)

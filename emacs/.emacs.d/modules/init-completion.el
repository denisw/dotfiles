;;; init-completion.el --- Configuration of the completion system

;; https://github.com/minad/vertico
(use-package vertico
  :ensure t
  :config
  (vertico-mode))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)
              ("C-l" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; https://github.com/oantolin/orderless
(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; https://github.com/minad/consult
(use-package consult
  :ensure t
  :bind
  ("C-x b" . consult-buffer)
  ("C-x 4 b" . consult-buffer-other-window)
  ("C-x 5 b" . consult-buffer-other-frame)
  ("C-x r b" . consult-bookmark)
  ("C-x p b" . consult-project-buffer)
  ("M-s r" . consult-ripgrep)
  ("M-s l" . consult-line)
  ("M-s L" . consult-line-multi)
  ("M-s m" . consult-multi-occur))

;; https://github.com/oantolin/embark
(use-package embark
  :ensure t
  :bind (("C-." . embark-act))
  :config
  (setq embark-quit-after-action nil)
  (setq embark-pre-action-hooks (assoc-delete-all 'kill-buffer embark-pre-action-hooks)))
(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-completion)

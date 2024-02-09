;;; init-completion.el --- Configuration of the completion system

;; https://github.com/minad/vertico
(use-package vertico
  :elpaca (vertico :files (:defaults "extensions/*"))
  :config
  (vertico-mode))

(use-package vertico-directory
  :elpaca nil
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)
              ("C-l" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :demand t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; https://github.com/minad/consult
(use-package consult
  :demand t
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

(provide 'init-completion)

;;; my-writing.el --- Writing modes and tools

;; Markdown mode
(use-package markdown-mode
  :ensure t)

;; Distraction-free writing -- https://github.com/rnkn/olivetti
(use-package olivetti
  :ensure t)

;; Live Markdown preview -- https://github.com/shime/emacs-livedown
(require 'livedown)

(provide 'my-writing)

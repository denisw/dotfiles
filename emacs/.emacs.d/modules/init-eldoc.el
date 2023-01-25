;;; init-eldoc.el --- Configuration for Eldoc

(use-package eldoc
  :diminish eldoc-mode
  :init
  ;; Limit echo area size to a single line.
  ;; Prevents long eldoc strings from covering half of the window.
  (setq max-mini-window-height 1))

(provide 'init-eldoc)

;;; init-hydra.el --- Hydra key-chord system

;; https://github.com/abo-abo/hydra
(use-package hydra
  :straight t
  :after evil
  :config

  (defhydra hydra-space (:color blue :idle 1.0 :hint nil)
    "
_:_ → M-x            _g_ → magit
_b_ → switch buffer  _k_ → kill buffer
_d_ → dired          _p_ → +project
_f_ → find file
"
    ("b" my/switch-to-buffer)
    ("d" dired)
    ("f" my/find-file)
    ("g" magit)
    ("p" hydra-project/body)
    ("k" kill-this-buffer)
    (":" my/M-x))

  (defhydra hydra-project (:color blue :idle 0.5 :hint nil)
    "
+project
_c_ → compile project    _s_ → search
_f_ → find project file  _s_ → ripgrep
_r_ → replace            _t_ → tree
"
    ("c" project-compile)
    ("f" project-find-file)
    ("r" project-query-replace-regexp)
    ("s" project-find-regexp)
    ("S" consult-ripgrep)
    ("t" dired-sidebar-toggle-sidebar))

  (evil-global-set-key 'normal (kbd "<SPC>") 'hydra-space/body))

(provide 'init-hydra)

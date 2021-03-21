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
_c_ → compile project
_f_ → find project file
_r_ → replace
_R_ → replace regexp
_s_ → search
"
    ("c" projectile-compile-project)
    ("f" projectile-find-file)
    ("r" projectile-replace)
    ("R" projectile-replace-regexp)
    ("s" projectile-ag))

  (evil-global-set-key 'normal (kbd "<SPC>") 'hydra-space/body))

(provide 'init-hydra)

;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers '(auto-completion
                                       clojure
                                       elixir
                                       emacs-lisp
                                       git
                                       go
                                       javascript
                                       latex
                                       markdown
                                       octave
                                       org
                                       php
                                       python
                                       react
                                       ruby
                                       syntax-checking
                                       yaml)
   dotspacemacs-additional-packages '(exec-path-from-shell)
   dotspacemacs-excluded-packages '(rainbow-delimiters)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-themes '(atom-one-dark
                         solarized-light
                         solarized-dark)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-whitespace-cleanup 'changed))

(defun dotspacemacs/user-init ()
  (setq go-tab-width 2)
  )

(defun dotspacemacs/user-config ()
  (setq-default
   ;; helm (workaround for https://github.com/syl20bnr/spacemacs/issues/4538)
   helm-echo-input-in-header-line nil

   ;; js-mode and json-mode
   js-indent-level 2

   ;; js2-mode
   js2-basic-offset 2
   js2-indent-level 2
   js2-strict-missing-semi-warning nil
   js2-strict-trailing-comma-warning nil
   css-indent-offset 2

   ;; web-mode
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)


  ;; Let Projectile ignore node_modules
  (setq projectile-globally-ignored-directories '("node_modules"))

  (global-set-key (kbd "C-w") 'backward-kill-word)

  ;; Use conf-mode for .env files
  (add-to-list 'auto-mode-alist '("\\.env\\'" . conf-mode))

  ;; Use json-mode for well-known JSON-based config files
  (add-to-list 'auto-mode-alist '("\\.babelrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . json-mode))

  ;; Use web-mode for .js files, to support JSX files without .jsx extension
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (web-mode-set-content-type "jsx")))

  ;; Enable and configure Flycheck
  (global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  ;; Use PHP mode for .php files
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

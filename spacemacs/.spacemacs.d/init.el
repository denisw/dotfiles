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
   dotspacemacs-themes '(solarized-light
                         atom-one-dark
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yapfify uuidgen rake py-isort org-projectile org-download livid-mode skewer-mode simple-httpd live-py-mode link-hint git-link flycheck-mix eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump column-enforce-mode clojure-snippets yaml-mode ws-butler window-numbering web-mode web-beautify volatile-highlights vi-tilde-fringe toc-org tagedit spacemacs-theme spaceline powerline smooth-scrolling smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe restart-emacs rbenv pyvenv pytest pyenv-mode py-yapf popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets open-junk-file neotree move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu emmet-mode elisp-slime-nav drupal-mode php-mode define-word cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-go go-mode company-auctex company-anaconda coffee-mode clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider spinner queue clojure-mode chruby bundler inf-ruby buffer-move bracketed-paste auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed auctex anaconda-mode pythonic f s alchemist company dash elixir-mode pkg-info epl aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

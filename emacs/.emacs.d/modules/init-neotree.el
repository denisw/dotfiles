;;; init-neotree.el --- Neotree file manager

(defun my-neotree-hook ()
  ;; Set keybindings that work better with Evil.
  ;; https://www.emacswiki.org/emacs/NeoTree
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))

;; Command to open Neotree at the project root directory.
;; https://www.emacswiki.org/emacs/NeoTree
(defun neotree-project-dir ()
  "Open NeoTree using the project root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find project root."))))

;; https://github.com/jaypei/emacs-neotree
(use-package neotree
  :straight t
  :hook (neotree-mode-hook . my-neotree-hook)
  :config
  (setq neo-theme 'nerd)

  ;; Remove the background and border from the header.
  (set-face-attribute 'neo-root-dir-face nil
                      :background nil
                      :box nil)

  ;; Shorten the header text to just the root directory name.
  (defun neo-path--shorten (path len)
    (file-name-nondirectory (directory-file-name path))))

(provide 'init-neotree)

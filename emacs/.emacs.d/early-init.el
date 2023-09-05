;; Minimize UI clutter.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Make the frame titlebar transparent on macOS.
(setq default-frame-alist '((ns-transparent-titlebar . t)))

;; Disable package.el. (Use straight.el instead.)
(setq package-enable-at-startup nil)

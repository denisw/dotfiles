;;; init-treesit.el --- Configuration of Emacs' Tree-Sitter support

;; Use the Tree-Sitter versions for some major modes.
(setq major-mode-remap-alist
      '((css-mode . css-ts-mode)
        (js-mode . js-ts-mode)
        (js2-mode . js-ts-mode)
        (json-mode . json-ts-mode)
        (python-mode . python-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)))

(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (c . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (css . ("https://github.com/tree-sitter/tree-sitter-css"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go"))
        (html . ("https://github.com/tree-sitter/tree-sitter-html"))
        (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
        (json . ("https://github.com/tree-sitter/tree-sitter-json"))
        (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
        (make . ("https://github.com/alemuller/tree-sitter-make"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        (php . ("https://github.com/tree-sitter/tree-sitter-php"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
        (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
        (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
        (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
        (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))))

(defun my/treesit-install-grammars ()
  (interactive)
  (dolist (entry treesit-language-source-alist)
    (treesit-install-language-grammar (car entry))))

(provide 'init-treesit)

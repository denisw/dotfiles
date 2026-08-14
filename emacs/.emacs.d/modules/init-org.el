;;; init-org.el --- Org Mode configuration  -*- lexical-binding: t; -*-

(setopt org-directory "~/Documents/Org")
(setopt org-default-notes-file "~/Documents/Org/inbox.org")

(setq org-capture-templates
      '(("t"
         "Todo"
         entry
         (file+headline org-default-notes-file "Inbox")
         "* TODO %?"
         :empty-lines-after 1)))

(provide 'init-org)

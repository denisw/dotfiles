;;; init-azure.el --- Configuration for working with Microsoft Azure

;; https://github.com/josteink/bicep-ts-mode
(use-package bicep-ts-mode
  :ensure t
  :mode (("\\.bicep\\'" . bicep-ts-mode)
         ("\\.bicepparam\\'" . bicep-ts-mode)))

(provide 'init-azure)

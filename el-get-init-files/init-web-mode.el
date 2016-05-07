(when (require 'web-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.html?$"  . web-mode))
;;  (add-to-list 'auto-mode-alist '("\\.css$"    . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js$"     . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx$"    . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php$"    . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jspx?$"  . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb$"    . web-mode))
  (add-to-list 'auto-mode-alist '("\\.cshtml$" . web-mode))
  (define-key web-mode-map  (kbd "C-c C-;") 'web-mode-comment-or-uncomment)
  (add-hook 'web-mode-hook
            (lambda () (setq web-mode-markup-indent-offset 2))))

;;; init-web-mode ends here


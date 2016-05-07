;;; init-emmet-mode.el ---
(when (require 'emmet-mode nil t)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
  (define-key emmet-mode-keymap (kbd "C-c C-i") 'emmet-expand-line))

;;; init-emmet-mode ends here

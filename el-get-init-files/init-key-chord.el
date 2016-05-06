(setq key-chord-two-keys-delay 0.04)
(key-chord-mode t)
(key-chord-define-global "hj" 'undo)
(key-chord-define-global "jk" 'view-mode)
(key-chord-define-global ",." "<>\C-b")
(key-chord-define-global "()" "()\C-b")
(key-chord-define-global "90" "()\C-b")

(key-chord-define-global "cv" 'customize-variable)
(key-chord-define-global "cg" 'customize-group)

;;; init-key-chord.el ends here

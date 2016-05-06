(global-flycheck-mode)
(when (require 'key-chord nil t)
  (key-chord-define-global "ne" 'flycheck-next-error)
  (key-chord-define-global "pe" 'flycheck-previous-error))

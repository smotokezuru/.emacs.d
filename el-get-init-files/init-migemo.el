;;; Commentary:
;;; migemo設定
;;; Code:
(when (require 'migemo nil t)
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"
        migemo-command "/usr/local/bin/cmigemo"
        migemo-options '("-q" "--emacs")
        migemo-user-dictionary nil
        migemo-coding-system 'utf-8
        migemo-regex-dictionary nil)
  (migemo-init))
;;; init-migemo ends here

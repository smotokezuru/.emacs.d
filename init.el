;;; Code:
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;; Environment > Initialization
;; Non-nil inhibits the initial startup echo area message.
(setq inhibit-startup-message  t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)


;;; Environment > Frames
(tool-bar-mode 0)
(scroll-bar-mode 0)
(unless (featurep 'ns)
  (menu-bar-mode 0))
(setq frame-title-format (format "%%f - Emacs@%s" system-name)
      icon-title-format  "%b"
      default-frame-alist (append '((alpha  . (90 90))
;;                                  (height . 46)
                                    (width  . 180)) default-frame-alist))

;;; Environment > Frames > Cursor
(blink-cursor-mode 0)

;;; Environment > Display
(setq visible-bell t)

;;; Environment > Windows
(setq scroll-step 1)

;;; Environment > Menu
;; Non-nil means mouse commands use dialog boxes to ask questions.
(setq use-dialog-box nil)

;;; Environment > Mode Line
(setq column-number-mode t
      line-number-mode t)

;;; Environment > Minibuffer
(setq history-length 1000
      history-delete-duplicates t)
;(setq echo-keystrokes 0.1)

;;; Environment > Minibuffer > Savehist
(savehist-mode t)

;;; Editing > Editing Basics
(setq-default require-final-newline t
              tab-width 4)
(delete-selection-mode t)

;;; Editing > Indent
(setq-default indent-tabs-mode nil)

;;; Editing > Editing Basics > Cua
(cua-mode t)
(global-set-key (kbd "C-x SPC") 'cua-set-rectangle-mark)

;;; Editing > Killing
(setq kill-whole-line 1
      show-trailing-whitespace t)
(setq backward-delete-char-untabify-method 'hungry)

;;; Editing > Matching > Paren Matching > Paren Showing
(show-paren-mode)
(setq show-paren-style 'mixed
      show-paren-delay 0)
;(set-face-background 'show-paren-match-face "Green")
;(set-face-foreground 'show-paren-match-face "Black")
;(set-face-background 'show-paren-mismatch-face "Red")
;(set-face-foreground 'show-paren-mismatch-face "Black")

;;; Files > Dired > Wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; Files > Recentf
(setq recentf-max-saved-items 500
      recentf-exclude         '("/TAGS$" "/var/tmp/"))

;;; Files > Auto Insert
(auto-insert-mode)
(setq auto-insert-directory "~/auto-insert/")
(define-auto-insert "\\.html?$" "html-template.html")

;;; Programming > Tools > Which Func
(which-function-mode 1)

;;; Convinience > Hl Line
(global-hl-line-mode t)
;;(set-face-background 'hl-line "darkolivegreen")

;;; Convinience > Linum
(global-linum-mode)
(setq linum-format "%4d")

;;; Development > Internal > Storage Allocation
(setq gc-cons-threshold (* 50 gc-cons-threshold))

;;; Development > Debug
(setq message-log-max 10000)
(fset 'yes-or-no-p 'y-or-n-p)

;;; Data > Save Place
(setq-default save-place t)
(require 'saveplace)

;;; Global key bindings
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "C-m")     'newline-and-indent)
(global-set-key (kbd "C-o")     'other-window)
(global-set-key (kbd "C-c i")   'indent-region)
(global-set-key (kbd "C-c C-i") 'dabbrev-expand)
(global-set-key (kbd "C-c ;")   'comment-region)
(global-set-key (kbd "C-c :")   'uncomment-region)
(global-set-key (kbd "M-h")     'backward-kill-word)
(global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "M-?")     'help-for-help)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-unset-key (kbd "C-z"))   ; disable suspend emacs
;(global-unset-key (kbd "C-\\")) ; disable swiching IM

;;; Key Settings for OSX Cocoa
(when (featurep 'ns)
  ;; prevent key interception by osx's input method
  (setq mac-pass-control-to-system nil
        mac-pass-command-to-system nil
        mac-pass-option-to-system  nil
        mac-command-key-is-meta    nil)
  (setq ns-command-modifier        'meta
        ns-alternate-modifier      'super)
  (define-key global-map [ns-drag-file] 'ns-find-file))

;;; Command Alias
(defalias 'qrr 'query-replace-regexp)
(defalias 'qr  'query-replace)
(defalias 'cg  'customize-group)
(defalias 'cv  'customize-variable)


;;; Application > Package
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("melpa-stable" . "http://stable.melpa.org/packages/"))
;  (add-to-list 'package-archives
;	       '("melpa" . "http://melpa.org/packages/"))
;  (add-to-list 'package-archives
;	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize))

;;; Convinience > El Get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq el-get-user-package-directory
      (locate-user-emacs-file "el-get-init-files"))
(el-get 'sync)

;;; packages
(el-get-bundle auto-complete)
(el-get-bundle color-moccur)
(el-get-bundle ddskk)
(el-get-bundle diminish)
(el-get-bundle flycheck)
(el-get-bundle key-chord)
(el-get-bundle migemo)
(el-get-bundle emmet-mode)

;;; git
(el-get-bundle magit)
(el-get-bundle git-gutter)

(el-get-bundle helm)
(el-get-bundle quickrun)
(el-get-bundle rainbow-delimiters)
(el-get-bundle undo-tree)
(el-get-bundle web-mode)
(el-get-bundle yasnippet)
;(el-get-bundle smart-cursor-color)
;(smart-cursor-color-mode 1)

(when (featurep 'ns)
  (set-face-attribute 'default nil :family "Ricty" :height 140)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (cons "Ricty" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0212
                    (cons "Ricty" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
                    'katakana-jisx0201
                    (cons "Ricty" "iso10646-1")))

;;; Help > Customize
;;; Theme
;;(load-theme 'adwaita)
;;(load-theme 'deeper-blue)
;;(load-theme 'dichromacy)
;;(load-theme 'adwaita)
;;(load-theme 'light-blue)
;;(load-theme 'manoj-dark)
(load-theme 'misterioso)
;;(load-theme 'tango)
;;(load-theme 'tango-dark)
;;(load-theme 'tsdh-dark)
;;(load-theme 'tsdh-light)
;;(load-theme 'wheatgrass)
;;(load-theme 'whiteboard)
;;(load-theme 'wombat)

;;; init.el ends here

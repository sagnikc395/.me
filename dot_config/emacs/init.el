;; sagnik's emacs config date: 24/2/25

;;don't show the splash screen
(setq inhibit-startup-message t)
;; flash when the bell rings
(setq visible-bell t)

;;enabling or disabling features
;; turn off some unnneded UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;line numbers
(global-display-line-numbers-mode 1)

;;color theme - inbuilt
(load-theme 'modus-vivendi :no-confirm)


;;rememeber recently edited files
(recentf-mode 1)
;; M-x recentf-open-files to open the files

;; macos emacs things
(setq mac-control-modifier 'control)
(setq mac-command-modifier 'meta)
(setq mac-right-option-modifier 'control)


;;prevent emacs from creating backup files
(setq make-backup-files nil)

;; font size setup
(set-face-attribute 'default nil
		    :height 180
		    :family "Input Mono"
		    :weight 'normal
		    :width 'normal)

;; melpa support
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rust-mode pyenv-mode elpy corfu exec-path-from-shell haskell-mode htmlize simple-httpd)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)


;;haskell setup

(use-package eglot
  :config
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  :custom
  (eglot-autoshutdown t)  ;; shutdown language server after closing last file
  (eglot-confirm-server-initiated-edits nil)  ;; allow edits without confirmation
  )

(use-package exec-path-from-shell)
(when (daemonp)
  (exec-path-from-shell-initialize))

;; C-c C-c key to compile the haskell binary
(use-package haskell-mode
  :bind (:map haskell-mode-map
              (("C-c C-c" . haskell-compile))))


;;python setup
(elpy-enable)
(pyenv-mode)

;;rust setup
(add-hook 'rust-mode-hook 'eglot-ensure)
(require 'eglot)
(add-to-list 'eglot-server-programs
             '((rust-ts-mode rust-mode) .
               ("rustup" "run" "stable" "rust-analyzer" :initializationOptions (:check (:command "clippy")))))

;; corfu setup
   ;;;; Code Completion
    ;;;; Code Completion
    (use-package corfu
      :ensure t
      ;; Optional customizations
      :custom
      (corfu-cycle t)                 ; Allows cycling through candidates
      (corfu-auto t)                  ; Enable auto completion
      (corfu-auto-prefix 2)           ; Minimum length of prefix for completion
      (corfu-auto-delay 0)            ; No delay for completion
      (corfu-popupinfo-delay '(0.5 . 0.2))  ; Automatically update info popup after that numver of seconds
      (corfu-preview-current 'insert) ; insert previewed candidate
      (corfu-preselect 'prompt)
      (corfu-on-exact-match nil)      ; Don't auto expand tempel snippets
      ;; Optionally use TAB for cycling, default is `corfu-complete'.
      :bind (:map corfu-map
                  ("M-SPC"      . corfu-insert-separator)
                  ("TAB"        . corfu-next)
                  ([tab]        . corfu-next)
                  ("S-TAB"      . corfu-previous)
                  ([backtab]    . corfu-previous)
                  ("S-<return>" . corfu-insert)
                  ("RET"        . corfu-insert))

      :init
      (global-corfu-mode)
      (corfu-history-mode)
      (corfu-popupinfo-mode) ; Popup completion info
      :config
      (add-hook 'eshell-mode-hook
                (lambda () (setq-local corfu-quit-at-boundary t
                                       corfu-quit-no-match t
                                       corfu-auto nil)
                  (corfu-mode))
                nil
                t))

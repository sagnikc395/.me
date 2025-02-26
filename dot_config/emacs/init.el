;; sagnik's emacs config
;; date: 24/2/25

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
 '(package-selected-packages '(htmlize simple-httpd)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

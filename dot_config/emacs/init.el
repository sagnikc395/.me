(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "CommitMono" :height 160)


;;enable copying to clipboard
(setq x-select-enable-clipboard t)


;;; I prefer cmd key for meta -> mac shenanigans 
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; automatically complete brackets
(electric-pair-mode t)


;; Display line numbers
(global-display-line-numbers-mode 1)

;;theming and stuff
;(load-theme 'acme t)
;(setq acme-theme-black-fg t)
;;(load-theme 'spacemacs-dark t)


(require 'ef-themes)

;; If you like two specific themes and want to switch between them, you
;; can specify them in `ef-themes-to-toggle' and then invoke the command
;; `ef-themes-toggle'.  All the themes are included in the variable
;; `ef-themes-collection'.
(setq ef-themes-to-toggle '(ef-dream ef-melissa-light))

(setq ef-themes-headings ; read the manual's entry or the doc string
      '((0 variable-pitch light 1.9)
        (1 variable-pitch light 1.8)
        (2 variable-pitch regular 1.7)
        (3 variable-pitch regular 1.6)
        (4 variable-pitch regular 1.5)
        (5 variable-pitch 1.4) ; absence of weight means `bold'
        (6 variable-pitch 1.3)
        (7 variable-pitch 1.2)
        (t variable-pitch 1.1)))

;; They are nil by default...
(setq ef-themes-mixed-fonts t
      ef-themes-variable-pitch-ui t)

;; Disable all other themes to avoid awkward blending:
(mapc #'disable-theme custom-enabled-themes)

;; Load the theme of choice:
(load-theme 'ef-dream :no-confirm)

;; OR use this to load the theme which also calls `ef-themes-post-load-hook':
;; (ef-themes-select 'ef-summer)



(setq backup-directory-alist            '((".*" . "~/.Trash")))

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
 '(custom-safe-themes
   '("7b602fe4a324dc18877dde647eb6f2ff9352566ce16d0b888bfcb870d0abfd70" default))
 '(package-selected-packages
   '(ef-themes gofumpt comment-tags company doom-modeline ivy lsp-mode markdown-mode modus-themes racket-mode)))

;;ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; setup company globally
(add-hook 'after-init-hook 'global-company-mode)

;; racket configuration

(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "<f5>") 'racket-run)))
;; smart parenthesis for lisp
(require 'smartparens-config)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande" :height 1.6 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande" :height 1.5))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande" :height 1.3))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande" :height 1.2))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Lucida Grande")))))

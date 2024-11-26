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
(load-theme 'spacemacs-dark t)


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
   '(comment-tags org-super-agenda org-modern spacemacs-theme ample-theme company doom-modeline go-mode ivy lsp-mode markdown-mode modus-themes racket-mode)))
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


(use-package lsp-mode
    :hook (XXX-mode . lsp-deferred)
    :commands (lsp lsp-deferred))

(setq lsp-go-analyses '((shadow . t)
                        (simplifycompositelit . :json-false)))


;; basic org mode settings; copied from https://github.com/james-stoup/emacs-org-mode-tutorial?tab=readme-ov-file#org56377d5

;; Setup use-package just in case everything isn't already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
(use-package org
  :pin gnu)

;; Must do this so the agenda knows where to look for my files
(setq org-agenda-files '("~/org"))

;; When a TODO is set to a done state, record a timestamp
(setq org-log-done 'time)

;; Follow the links
(setq org-return-follows-link  t)

;; Associate all org files with org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Make the indentation look nicer
(add-hook 'org-mode-hook 'org-indent-mode)

;; Remap the change priority keys to use the UP or DOWN key
(define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
(define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)

;; Shortcuts for storing links, viewing the agenda, and starting a capture
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; When you want to change the level of an org item, use SMR
(define-key org-mode-map (kbd "C-c C-g C-r") 'org-shiftmetaright)

;; Hide the markers so you just see bold text as BOLD-TEXT and not *BOLD-TEXT*
(setq org-hide-emphasis-markers t)

;; Wrap the lines in org mode so that things are easier to read
(add-hook 'org-mode-hook 'visual-line-mode)

;; layout / UI Changes

(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans 3")   '(:font "Source Sans 3"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 1.6 :underline nil))))))


;; Work log Configuration for Org mode
;; useful for daily tasks completed and for checking progress

(setq org-capture-templates
      '(    
        ("j" "Work Log Entry"
         entry (file+datetree "~/org/work-log.org")
         "* %?"
         :empty-lines 0)
        
      ;; simple notes
      ("n" "Note"
       entry (file+headline "~/org/notes.org")
       "** %?"
       :empty-lines 0)
      
      ;; general todo
      ("g" "General To-Do"
       entry (file+headline "~/org/todos.org")
       "* TODO [#B] %?\n:Created: %T\n "
       :empty-lines 0)
      
      ;; code todo
      ("c" "Code To-Do"
       entry (file+headline "~/org/todos.org")
       "* TODO [#B] %?\n:Created: %T\n%i\n%a\nProposed Solution: "
       :empty-lines 0)
      )
      )

;; TODO states
(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "VERIFYING(v!)" "BLOCKED(b@)"  "|" "DONE(d!)" "OBE(o@!)" "WONT-DO(w@/!)" )
        ))


;; TODO colors
(setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "GoldenRod" :weight bold))
        ("PLANNING" . (:foreground "DeepPink" :weight bold))
        ("IN-PROGRESS" . (:foreground "Cyan" :weight bold))
        ("VERIFYING" . (:foreground "DarkOrange" :weight bold))
        ("BLOCKED" . (:foreground "Red" :weight bold))
        ("DONE" . (:foreground "LimeGreen" :weight bold))
        ("OBE" . (:foreground "LimeGreen" :weight bold))
        ("WONT-DO" . (:foreground "LimeGreen" :weight bold))
        ))





(fset 'yes-or-no-p 'y-or-n-p)

(setq gc-cons-threshold most-positive-fixnum)

(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))

(setq delete-old-versions t)
(setq backup-directory-alist (quote (("." . "~/.backups"))))
(setq default-buffer-file-coding-system 'utf-8)
(setq auto-save-default nil)

(electric-pair-mode nil)
(show-paren-mode t)
(setq-default indent-tabs-mode nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode +1)
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-message t)

(use-package saveplace
  :ensure t
  :hook (after-init . (lambda () (save-place-mode t))))

(setq load-prefer-newer t)

(setq inhibit-compacting-font-caches nil)

(setq scroll-step 2
      scroll-margin 6
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position 'always)

(setq auto-window-vscroll nil)
(setq truncate-partial-width-windows nil)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)

(setq mouse-yank-at-point nil)

(setq-default fill-column 80)

(add-hook 'after-change-major-mode-hook (lambda ()
                                          (modify-syntax-entry ?_ "w")))

(add-hook 'after-change-major-mode-hook (lambda ()
                                          (modify-syntax-entry ?- "w")))

(use-package which-key
  :ensure t
  :custom
  (which-key-popup-type 'side-window)
  :config (which-key-mode 1))

(use-package ace-window
  :ensure t
  :init
  :bind ("M-o" . 'ace-window))

(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git))
  :config)

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-r" . swiper-isearch-backward)
  :config (setq swipe-action-recenter t
		swiper-include-line-number-in-search t)
                (progn
                  (ivy-mode 1)
                  (setq ivy-use-virtual-buffers t)
                  (setq ivy-display-style 'fancy)))

(use-package ivy-posframe
  :ensure t
  :hook (after-init . ivy-posframe-mode)
  :config (setq ivy-posframe-display-functions-alist
                '((swiper . ivy-display-function-fallback)
                  (complete-symbol . ivy-posframe-display-at-point)
                  (counsel-M-x . ivy-posframe-display-at-frame-center)
                  (t . ivy-posframe-display))
                ivy-posframe-parameters
                '((left-fringe . 15)
                  (right-fringe . 15))
                ivy-posframe-height-alist
                '((swiper . 20)
                  (t . 20))))

(use-package ivy-fuz
  :ensure t
  :demand t
  :after ivy
  ;:custom
  ;(ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
  ;(ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))
  :config
  ;(add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn))
  )

(use-package xclip
  :ensure t
  :hook (after-init . xclip-mode))

(provide 'init-startup)

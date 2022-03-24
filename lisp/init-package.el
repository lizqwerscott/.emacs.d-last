(use-package restart-emacs)

(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/activate))

(use-package company
  :diminish (company-mode " Cmp.")
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-other-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minimum-prefix-length 1
	company-show-numbers t
	company-tooltip-limit 20
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command)
        company-ispell-dictionary "/usr/share/dict/words")
  (push 'company-sql 'company-backends)
  (eval-after-load 'company
    '(add-to-list 'company-backends
		  '(company-abbrev company-yasnippet company-capf company-dabbrev company-files company-keywords)
                  'company-ispell)))

(use-package yasnippet
  :ensure t)

(use-package common-lisp-snippets
  :ensure t)

(with-eval-after-load 'company
  (company-tng-configure-default)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-global-modes '(not text-mode outline-mode fundamental-mode org-mode diff-mode shell-mode eshell-mode)
        flycheck-emacs-lisp-load-path 'inherit))

(setq evil-want-keybinding nil)

(use-package evil
  :ensure t
  :hook (after-init . evil-mode)
  :init
  (progn
    (setq evil-want-integration t)
    (setq evil-want-minibuffer nil)))

(use-package evil-leader
  :ensure t
  :config (progn
	   (evil-leader/set-leader "<SPC>")
	   (global-evil-leader-mode)))

(use-package evil-paredit
  :after evil)

(add-hook 'paredit-mode-hook #'(lambda ()
                                 (evil-paredit-mode 1)))

(use-package sly
  :ensure t
  :hook (common-lisp-mode . sly-edig-mode)
  :config (setq sly-complete-symbol-function 'sly-simple-completions))
(setq inferior-lisp-program "ccl")

(use-package sly-quicklisp
  :ensure t
  :after sly)

(use-package sly-asdf
  :ensure t
  :after sly)

(use-package paredit
  :ensure t)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '("~/project/" ("~/quicklisp/local-projects/" . 1))))

(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t))

(use-package magit
  :ensure t)

(use-package vc-msg
  :ensure t)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

(use-package evil-collection
  :ensure t
  :after evil
  :init
  (evil-collection-init))

(use-package evil-matchit
  :ensure t
  :init (global-evil-matchit-mode 1))

(setq browse-url-browser-function 'browse-url-chrome)

(use-package go-translate
  :ensure t
  :config
  (setq gts-translate-list '(("en" "zh")))
  (setq gts-default-translator
        (gts-translator
         :picker (gts-noprompt-picker)
         :engines (list (gts-bing-engine)
                        (gts-google-engine))
         :render (gts-posframe-pop-render))))

;;(require 'go-translate)

(provide 'init-package)

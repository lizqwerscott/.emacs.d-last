;;theme

(set-frame-font "Source Code Pro 15")
(set-face-attribute 'default t :font "Source Code Pro 15")
;(set-face-attribute 'default nil :height 140)

(when (member "Symbola" (font-family-list))
  (set-fontset-font "fontset-default" nil
                    (font-spec :size 20 :name "Symbola")))

(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))

(global-hl-line-mode 1)

(use-package gruvbox-theme
  :ensure t
  :init (load-theme 'gruvbox-dark-soft t))

(use-package doom-themes
  :ensure t)

(use-package lab-themes
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons
  :ensure t)

(use-package emacs
  :unless *is-windows*
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'project)
  :hook ((after-init . dashboard-refresh-buffer)))

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'column))

(provide 'init-ui)

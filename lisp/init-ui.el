;;theme

;(set-frame-font "Source Code Pro Light 14")
(set-face-attribute 'default nil :height 130)

(global-hl-line-mode 1)

(use-package gruvbox-theme
  :ensure t
  :init (load-theme 'gruvbox-dark-soft t))

(use-package doom-themes
  :ensure t)

(use-package lab-themes
  :ensure t)

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

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
  :hook ((after-init . dashboard-refresh-buffer)))
  

(provide 'init-ui)

(let ((gc-cons-threshold most-positive-fixnum))
  (add-to-list 'load-path
	       (expand-file-name (concat user-emacs-directory "lisp")))
  (add-to-list 'load-path
               (expand-file-name (concat user-emacs-directory "company"))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const)
;(require 'init-elpa)
(require 'init-melpa)
(require 'init-startup)
(require 'company-sql)
(require 'init-package)
(require 'init-func)
(require 'fcitx)
(require 'evil-map)
(require 'init-org)
(require 'init-ui)

(when (file-exists-p custom-file)
  (load-file custom-file))


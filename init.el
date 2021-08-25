(let ((gc-cons-threshold most-positive-fixnum))
  (add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp"))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const)
(require 'init-elpa)
(require 'init-startup)
(require 'init-package)
(require 'evil-map)
(require 'init-ui)

(when (file-exists-p custom-file)
  (load-file custom-file))


(evil-leader/set-key
  "s" 'swiper
  "f" 'counsel-find-file
  "b" 'counsel-switch-buffer
  "o" 'ace-window
  "0" 'ace-delete-window
  "1" 'ace-delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-horizontally
  "lf" 'sly-load-file
  "ef" 'sly-eval-defun
  "el" 'sly-eval-last-expression
  "W" 'paredit-wrap-sexp
  "S" 'paredit-splice-sexp
  "C-j" 'sly-next-completion)

(evil-define-key 'normal 'global (kbd "C-s") 'save-buffer)
(evil-define-key 'normal 'global (kbd "Q") 'save-buffers-kill-emacs)


(provide 'evil-map)

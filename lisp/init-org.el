
;; ga org-agenda gc org-capture gs org-store-link

(defun evil-org-insert-item (&optional checkbox)
  "使用evil 在org mode 插入新行"
  (interactive "p")
  (evil-open-below 1)
  (org-insert-item checkbox))

(add-hook 'org-mode-hook
          (lambda ()
            (evil-local-set-key 'normal
                                (kbd "t")
                                'evil-org-insert-item)))
;; space w
(defun open-my-org-file ()
  "打开我的org文件."
  (interactive)
  (find-file "~/Documents/Sync/org/index.org"))

(defun org-export-docx ()
  (interactive)
  (let ((docx-file (concat (file-name-sans-extension (buffer-file-name))
                           ".docx"))
        (template-file "/home/lizqwer/Documents/Templates/template.docx"))
    (shell-command
     (format "pandoc %s -o %s --reference-doc=%s"
             (buffer-file-name)
             docx-file
             template-file))
    (message "Convert finish: %s" docx-file)))

(defun org-insert-html-head ()
  (interactive)
  (insert "#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"http://gongzhitaao.org/orgcss/org.css\"/>"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (python . t)))

(require 'org)

(define-key org-mode-map (kbd "C-c TAB") 'org-insert-item)

(setq org-default-notes-file "~/Documents/Sync/org/index.org")

(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 2.0))

(setq org-capture-templates nil)

(add-to-list 'org-capture-templates '("t" "Tasks"))
(add-to-list 'org-capture-templates
             '("tp" "Project Write Task" entry
               (file+olp "~/Documents/Sync/org/tasks.org" "Project")
               "* TODO %^{任务名字}\n%u\n%a\n" :clock-in t :clock-resume t))

(add-to-list 'org-capture-templates
             '("tr" "Book Reading Task" entry
               (file+olp "~/Documents/Sync/org/tasks.org" "Reading" "Book")
               "* TODO %^{书名字}\n%u\n%a\n" :clock-in t :clock-resume t))

(add-to-list 'org-capture-templates
             '("w" "Web Collections" entry
               (file+headline "~/Documents/Sync/org/index.org" "Web")
               "* %U %:annotation\n\n%:initial\n\n%?"))

(add-to-list 'org-capture-templates
             '("i" "Inbox" entry
               (file "~/Documents/Sync/org/index.org")
               "* %U - %^{heading} %^g\n %?\n"))

(provide 'init-org)

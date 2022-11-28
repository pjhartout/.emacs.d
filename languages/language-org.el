(use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-image-actual-width nil)

(setq org-hide-emphasis-markers t)

(setq org-pretty-entities t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'org-mode-hook 'visual-line-mode)

(custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(setq tab-width 2)
(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)

(setq org-refile-targets '(("~/Documents/Git/org/gtd.org" :maxlevel . 3)
                           ("~/Documents/Git/org/someday.org" :maxlevel . 3)
                           ("~/Documents/Git/org/today.org" :maxlevel . 3)))

(setq org-structure-template-alist
      '(("a" . "export ascii\n")
        ("b" . "src bibtex")
        ("c" . "center\n")
        ("C" . "comment\n")
        ("e" . "src elisp\n")
        ("E" . "export")
        ("h" . "export html\n")
        ("l" . "export latex\n")
	("p" . "src python")
        ("q" . "quote\n")
        ("s" . "src")
        ("v" . "verse\n")))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
      '((emacs-lisp . t)
	(python . t))))

(defun org-execute-code-in-shell  (&optional arg _info)
  "Copy current src block's contents and execute it in code shell buffer."
  (interactive "P")
  (let ((this-window (selected-window))
	(info (org-babel-get-src-block-info)))
    (org-babel-switch-to-session arg info)
    (end-of-buffer)
    (yank)
    (comint-send-input)
    (comint-send-input)
    (comint-send-input)
    (select-window this-window)))

(org-defkey org-mode-map "\C-c\C-c" `org-execute-code-in-shell)
(org-defkey org-mode-map "\C-c\c" 'org-ctrl-c-ctrl-c)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "VERIFY" "DONE" "CANCELED"
                  "FIXME" "TEMP")))
(setq org-todo-keyword-faces
      '(("TODO" .  "orange") ("STARTED" . "yellow") ("TODO" . "red") ("DONE" . "green")
        ("CANCELED" . (:foreground "blue" :weight bold))))

(setq org-link-file-path-type 'relative)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t))
   ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
    :unnarrowed t))
  
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
	 :map org-roam-dailies-map
	 ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(provide 'language-org)

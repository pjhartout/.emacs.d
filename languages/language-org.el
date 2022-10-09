;; Source https://zzamboni.org/post/beautifying-org-mode-in-

;; Org mode package installs
(require 'package)
(setq package-list
      '(org-bullets
	org-roam))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))



;; Org mode appearance

;; use org bullets
(require 'org-bullets)

;; hide emphasis markers
(setq org-hide-emphasis-markers t)


;; font lock substitutions for unordered lists.
(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(require 'use-package)
(use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; Visual-line-mode is to enable the text of org documents to reflow.
(add-hook 'org-mode-hook 'visual-line-mode)

;; set faces for theme
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


;; Org mode behaviour

;; Set refile targets
(setq org-refile-targets '(("~/Documents/Git/org/gtd.org" :maxlevel . 3)
                           ("~/Documents/Git/org/someday.org" :maxlevel . 3)
                           ("~/Documents/Git/org/today.org" :maxlevel . 3)))

;; Tab behaviour
(setq tab-width 2)

;; structured templates
(setq org-structure-template-alist
      '(("a" . "export ascii\n")
        ("b" . "src bibtex")
        ("c" . "center\n")
        ("C" . "comment\n")
        ("e" . "elisp\n")
        ("E" . "export")
        ("h" . "export html\n")
        ("l" . "export latex\n")
	("p" . "src python")
        ("q" . "quote\n")
        ("s" . "src")
        ("v" . "verse\n")))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "VERIFY" "DONE" "CANCELED"
                  "FIXME" "TEMP")))
(setq org-todo-keyword-faces
      '(("TODO" .  "orange") ("STARTED" . "yellow") ("TODO" . "red") ("DONE" . "green")
        ("CANCELED" . (:foreground "blue" :weight bold))))


;; From Paul, copies and executes the code block in the shell
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

;; Rebind keys to org-execute-code-in-shell
(org-defkey org-mode-map "\C-c\C-c" `org-execute-code-in-shell)
(org-defkey org-mode-map "\C-c\c" 'org-ctrl-c-ctrl-c)

(provide 'language-org)

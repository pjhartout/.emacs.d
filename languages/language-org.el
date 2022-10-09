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
        ("q" . "quote\n")
        ("s" . "src")
        ("v" . "verse\n")))


(provide 'language-org)

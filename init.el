;; init.el --- Prelude-inspired custom config.

(message "[Emacs Config] Config is loading up.")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; don't check signature due to rainbow-mode signature verification
(setq package-check-signature nil)

;; load paths
(add-to-list 'load-path "~/.emacs.d/core")
(add-to-list 'load-path "~/.emacs.d/completion")
(add-to-list 'load-path "~/.emacs.d/projects")
(add-to-list 'load-path "~/.emacs.d/startup")
(add-to-list 'load-path "~/.emacs.d/terminal")
(add-to-list 'load-path "~/.emacs.d/languages")

(message "[Emacs Config] Loading core configurations.")
;; call core functionalities
(org-babel-load-file "~/.emacs.d/core/core-packages.org")
(org-babel-load-file "~/.emacs.d/core/core-appearance.org")
(org-babel-load-file "~/.emacs.d/core/core-editor.org")
(org-babel-load-file "~/.emacs.d/core/core-key-bindings.org")

(message "[Emacs Config] Loading non-core configurations.")
;; call specific functionalities relevant for the whole editor
(org-babel-load-file "~/.emacs.d/completion/completion.org")
(org-babel-load-file "~/.emacs.d/projects/projects.org")
(org-babel-load-file "~/.emacs.d/startup/startup.org")
(org-babel-load-file "~/.emacs.d/terminal/terminal.org")

(message "[Emacs Config] Loading language configs.")
;; call language-specific configurations
(org-babel-load-file "~/.emacs.d/languages/language-common.org")
(org-babel-load-file "~/.emacs.d/languages/language-org.org")
(org-babel-load-file "~/.emacs.d/languages/language-latex.org")
(org-babel-load-file "~/.emacs.d/languages/language-python.org")
(org-babel-load-file "~/.emacs.d/languages/language-pdf.org")

(message "[Emacs Config] Config is loaded up.")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" default))
 '(package-selected-packages
   '(emojify lsp-pyright py-isort poetry pyenv-mode blacken smartparens-config doom-themes helpful beacon undo-tree restart-emacs projectile nord-theme magit counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-slide-title-face ((t (:inherit font-lock-type-face))))
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
(put 'set-goal-column 'disabled nil)

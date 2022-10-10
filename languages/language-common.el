;; Packages and functionalities useful to multiple languages
(require 'package)
(setq package-list
      '(which-key))

; install the packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; LSP Mode, used for multiple languages
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; Which key
(use-package which-key
    :config
    (which-key-mode))

(provide 'language-common)
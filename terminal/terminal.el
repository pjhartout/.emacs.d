;; All kinds of useful terminal related things
;; see https://github.com/daviwil/emacs-from-scratch/blob/bbfbc77b3afab0c14149e07d0ab08d275d4ba575/Emacs.org#terminals

(use-package term
  :config
  (setq explicit-shell-file-name "zsh") ;; Change this to zsh, etc
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  (setq term-prompt-regexp "^[> $] *"))


(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[> $] *")
  (setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000))

(provide 'terminal)
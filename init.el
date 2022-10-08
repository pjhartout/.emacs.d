;; init.el --- Prelude-inspired custom config.

(message "[Emacs Config] Config is loading up.")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; load paths
(add-to-list 'load-path "~/.emacs.d/core")
(add-to-list 'load-path "~/.emacs.d/search")
(add-to-list 'load-path "~/.emacs.d/projects")
(add-to-list 'load-path "~/.emacs.d/startup")

;; call core functionalities
(require 'core-packages)
(require 'core-appearance)
(require 'core-key-bindings)

;; call specific functionalities
(require 'search-ivy)
(require 'projects-treemacs)
(require 'startup)


(message "[Emacs Config] Config is loaded up.")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(beacon undo-tree restart-emacs projectile nord-theme magit counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Startup screen emacs
(require 'use-package)
(setq use-package-always-ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to the last piece of software you will ever need.")
(setq dashboard-startup-banner "~/.emacs.d/emacs_logo.png")

(provide 'startup)

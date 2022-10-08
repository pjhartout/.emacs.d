(require 'use-package)

(use-package treemacs
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-display-in-side-window          t)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)))
	  
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;; use treemacs on startup
(add-hook 'emacs-startup-hook 'treemacs)

(provide 'projects-treemacs)



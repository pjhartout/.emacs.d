;; Package configuration for project management
(require 'use-package)

;; Setup Treemacs
(use-package treemacs
  :config
  (progn
    (setq treemacs-collapse-dirs
	  (if treemacs-python-executable 3 0)
          treemacs-display-in-side-window t)
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

;; Setup Wakatime to track time spent on each project in emacs.
(use-package wakatime-mode)
(global-wakatime-mode)
(setq wakatime-cli-path "${HOME}/.wakatime/wakatime-cli")

;; Projectile setup
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Documents/Git")
    (setq projectile-project-search-path '("~/Documents/Git")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(provide 'projects)


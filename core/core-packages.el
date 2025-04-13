(require 'package)

(setq package-list
      '(use-package
	projectile
        undo-tree
        magit
        ivy
        swiper
        counsel
        restart-emacs
	nord-theme
	exec-path-from-shell
	counsel-projectile
	forge
	eterm-256color
	vterm
	tablist
	pdf-tools
	balanced-windows
	yatemplate
	wakatime-mode))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))



; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'use-package)
(setq use-package-always-ensure t)

(setq projectile-mode-line "Projectile")

(provide 'core-packages)

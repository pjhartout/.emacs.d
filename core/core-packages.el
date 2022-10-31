;; Define package source
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

;; This sets the PATH used by the emacs config to the PATH of the terminal
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'use-package)
(setq use-package-always-ensure t)

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(provide 'core-packages)

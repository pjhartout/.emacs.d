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
        ))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))



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

(provide 'core-packages)

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
        ))

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))



; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'core-packages)

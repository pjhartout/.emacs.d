;; Install packages related to appearance

(require 'package)
(setq package-list
      '(beacon
	nord-theme
	all-the-icons
	all-the-icons-dired
	all-the-icons-ivy
	all-the-icons-ivy-rich
	all-the-icons-gnus
	treemacs
	treemacs-all-the-icons
	rainbow-mode
        doom-modeline
        ))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Set the theme
(require 'nord-theme)
(load-theme 'nord t)

;; Beacon mode
(require 'beacon)
(beacon-mode 1)
(setq beacon-color "#fdf6e3")


;; Set transparency
(set-frame-parameter (selected-frame) 'alpha '80)
(add-to-list 'default-frame-alist '(alpha . (80)))

;; Maximize on startup
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Hide menu bar
(tool-bar-mode -1)

;; Icons in dired mode
(require 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq all-the-icons-dired-monochrome nil)

;; Make rainbow-mode global
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(global-rainbow-mode 1)

;; Fonts
(set-face-attribute 'default t :font "Fira Code Retina")

;; Time and calendar format
(display-time-mode 1)

;; Better modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(provide 'core-appearance)


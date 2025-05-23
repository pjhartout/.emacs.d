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
        doom-modeline))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Set the theme
(use-package doom-themes)
(load-theme 'nord t)

;; Beacon mode
(require 'beacon)
(beacon-mode 1)
(setq beacon-color "#fdf6e3")


;; Set transparency
;; (set-frame-parameter (selected-frame) 'alpha '95)
;; (add-to-list 'default-frame-alist '(alpha . (95)))

;; Maximize on startup
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Built-in things we want to remove
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

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

;; Nerd icons
(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

;; Better modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Better themes
(use-package doom-themes)

;; Keep windows the same size when splitting
(use-package balanced-windows
  :config
  (balanced-windows-mode))

;; Visual bell instead of auditory bell
(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

;; Helpful help contexts

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package emojify
  :hook (after-init . global-emojify-mode))

(provide 'core-appearance)

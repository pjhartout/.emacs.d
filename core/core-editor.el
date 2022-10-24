;; Core text editor behaviour

;; Delete selection before typing replacing text.
(delete-selection-mode 1)

;; Ask for y or n instead of yes or no.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Line numbers
;; For any programming language, we enable line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; and also for org mode
(add-hook 'org-mode-hook 'display-line-numbers-mode)

;; Company
;; Text completion
(use-package company
  :custom
  (company-idle-delay 0.0)
  (company-minimum-prefix-length 4)
  (company-selection-wrap-around t)
  :hook
  ((text-mode-hook . company-mode)
   (prog-mode-hook . company-mode)))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; Flyspell
;; Spell checking for text (requires aspell)
(use-package flyspell
  :ensure t
  :init
  (setq ispell-program-name "aspell")
  :hook
  ((text-mode-hook . flyspell-mode)
   (prog-mode-hook . flyspell-prog-mode)))

;; Flycheck
;; Spell checking for code
(use-package flycheck
  :ensure t
  :init
  (setq flycheck-highlighting-mode 'symbols
    flycheck-indication-mode 'left-fringe
    flycheck-standard-error-navigation t)
  :hook
  (prog-mode-hook . flycheck-mode))


(provide 'core-editor)

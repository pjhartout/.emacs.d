;; Core text editor behaviour

;; Delete selection before typing replacing text.
(delete-selection-mode 1)

;; Ask for y or n instead of yes or no.
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'core-editor)

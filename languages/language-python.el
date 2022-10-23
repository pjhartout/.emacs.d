(require 'package)
(setq package-list
      '(python-black py-isort poetry))

; install the packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Main python mode
(require 'python)

;; ;; Language Server Protocol
;; (use-package lsp-pyright
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp))))  ; or lsp-deferred

;; format code on save using blacken
;; use-package does not seem to work here.

(require 'blacken)
(setq blacken-line-length 79)
(setq blacken-executable "/home/paul/.virtualenvs/py3.8/bin/black")
(add-hook 'python-mode-hook 'blacken-mode 'too-long-lines-mode)

;; py-isort
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(use-package poetry
  :ensure t)

(setq python-indent-guess-indent-offset 4)

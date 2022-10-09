(require 'package)
(setq package-list
      '(python-black py-isort poetry))

; install the packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Main python mode
(require 'python)

;; Language Server Protocol
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred

;; Format code on save using black
(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(use-package poetry
  :ensure t)

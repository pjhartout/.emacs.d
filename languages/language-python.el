(require 'package)
(setq package-list
      '(python-black py-isort poetry))

; install the packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Main python mode
;; Python
(use-package python
  :ensure t
  :custom
  ;; (python-shell-completion-native-enable nil)
  (python-indent-guess-indent-offset-verbose nil)
  (python-shell-buffer-name "IPython")
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "-i --simple-prompt")
  :hook
  ((python-mode-hook . flyspell-prog-mode)
   (python-mode-hook . flycheck-mode)
   (python-mode-hook . company-mode)))


;; Language Server Protocol
(use-package lsp-pyright
  :ensure t
  :after (python lsp-mode)
  :custom
  (lsp-pyright-venv-path (getenv "WORKON_HOME"))
  :hook
  (python-mode-hook . (lambda ()
			(require 'lsp-pyright) (lsp))))


;; pyenv-mode
;; Integrate pyenv with python-mode
(use-package pyenv-mode
  :ensure t
  :if (eq system-type 'darwin)
  :after python
  :hook
  (python-mode-hook . pyenv-mode))

;; Poetry virtual environment support
(use-package poetry
  :ensure t)


;; format code on save using blacken
;; use-package does not seem to work here.
(use-package blacken)
(setq blacken-line-length 79)
(setq blacken-executable "/home/paul/.virtualenvs/py3.8/bin/black")
(add-hook 'python-mode-hook 'blacken-mode 'too-long-lines-mode)

;; Sort imports with py-isort
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;; ;; pyvenv
;; ;; Python virtual environment support
;; (use-package pyvenv
;;   :ensure t
;;   :after python
;;   :custom
;;   (pyvenv-workon "env")
;;   :hook
;;   ((python-mode-hook . pyvenv-mode)
;;    (pyvenv-post-activate-hooks . pyvenv-restart-python)
;;    (pyvenv-post-deactivate-hooks . pyvenv-restart-python))
;;   :config
;;   (defalias 'workon 'pyvenv-workon)
;;   (defalias 'deactivate 'pyvenv-deactivate))


(setq python-indent-guess-indent-offset 4)

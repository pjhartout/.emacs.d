;; Main python mode

;; Python
(use-package python
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
  :after (python lsp-mode)
  ;; :custom
  ;; (lsp-pyright-venv-path (getenv "WORKON_HOME"))
  :hook
  (python-mode-hook . (lambda ()
			(require 'lsp-pyright) (lsp))))

;; pyenv-mode
;; Integrate pyenv with python-mode
(use-package pyenv-mode
  :if (eq system-type 'darwin)
  :after python
  :hook
  (python-mode-hook . pyenv-mode))

;; Poetry virtual environment support
(use-package poetry)
(add-hook 'python-mode-hook 'poetry-tracking-mode)
(setq poetry-tracking-strategy 'projectile)
(setq poetry-tracking-strategy 'switch-buffer)

;; format code on save using blacken
;; use-package does not seem to work here.
(use-package blacken
  :bind (:map python-mode-map ("C-c C-b" . blacken-buffer)))

(setq blacken-line-length 79)
(setq blacken-executable "/Users/philiphartout/.pyenv/shims/black")
(add-hook 'python-mode-hook 'blacken-mode 'too-long-lines-mode)

(define-advice org-edit-src-exit (:before (&rest _args) format-python)
  "Run `blacken-buffer' when leaving an org-mode Python source block."
  (when (eq major-mode 'python-mode)
    (blacken-buffer)))

;; sort imports with py-isort
(use-package py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(setq python-indent-guess-indent-offset 4)
(provide 'language-python)

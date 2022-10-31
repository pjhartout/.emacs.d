;; We're using the ivy completion framework in emacs

(require 'ivy)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Let's use ivy-rich as well
(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

;; Key bindings

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)

;; Company mode for completion

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; prescient for ranking of previously used commands
(straight-use-package 'prescient)
(straight-use-package 'ivy-prescient)
(straight-use-package 'company-prescient)

(provide 'search)

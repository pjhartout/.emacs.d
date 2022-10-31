;;; languages-pdf.el --- This file handles all of the pdf stuff on emacs  -*- lexical-binding: t; -*-

(use-package pdf-tools
 :config
 ;; initialise
 (pdf-tools-install)
 ;; open pdfs scaled to fit page
 (setq-default pdf-view-display-size 'fit-page)
 ;; automatically annotate highlights
 (setq pdf-annot-activate-created-annotations t)
 ;; use normal isearch
 (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

(pdf-loader-install) ; On demand loading, leads to faster startup time


(provide 'language-pdf)
;;; languages-pdf.el ends here
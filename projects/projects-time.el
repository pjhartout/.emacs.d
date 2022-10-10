;; Packages related to tracking time.
(require 'package)
(setq package-list
      '(wakatime-mode))

; install the packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(global-wakatime-mode)

(provide 'projects-time)


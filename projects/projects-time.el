
;; Packages related to tracking time.
(require 'package)
(setq package-list
      '(wakatime-mode))

; install the packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))



(global-wakatime-mode)
(setq wakatime-cli-path "/Users/philiphartout/.wakatime/wakatime-cli")

(provide 'projects-time)


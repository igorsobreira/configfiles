(setq make-backup-files nil)
(setq inhibit-splash-screen t)

(set-face-attribute 'default nil :height 120)

;; (setq mac-option-modifier nil)
;; (setq mac-command-modifier 'meta)

(add-to-list 'load-path "~/elisp")

(add-hook 'actionscript-mode-hook (lambda () (setq standard-indent 2)))

(require 'actionscript-mode)
(require 'go-mode-load)
(require 'puppet-mode)
(require 'lua-mode)
(require 'php-mode)
(require 'markdown-mode)
(require 'yaml-mode)
(require 'ini-mode)
(require 'textile-mode)
(require 'dirtree)
;; (require 'anything-match-plugin)
;; (require 'anything-config)
(require 'magit)
;; (require 'ess-site)
;; (require 'any-ini-mode)

;; (load "~/elisp/haskell-mode/haskell-site-file")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default truncate-lines "please don't")

(setq php-mode-force-pear t)

(setq tramp-default-method "ssh")

(setq ring-bell-function 'ignore)

(column-number-mode)

;; always update buffer if file was modified on disk without
;; asking for confirmation
(setq-default revert-without-query '(".*"))
(global-auto-revert-mode 1)

;; compilation configuration
(setq-default compilation-scroll-output t)
;; (setq-default compilation-skip-threshold 0) ; doesnt skip any message

(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.asc$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))
(add-to-list 'auto-mode-alist '("\\.ini$" . ini-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.textile$" . textile-mode))
(add-to-list 'auto-mode-alist '("\\.css.erb$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb$" . javascript-mode))

(put 'downcase-region 'disabled nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed 't) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; enables mouse scroll, but disabled defaults CMD+C/CMD+V
;; (require 'mouse)
;; (xterm-mouse-mode t)
;; (defun track-mouse (e))
;; (setq mouse-sel-mode t)
;; (global-set-key [mouse-4] '(lambda ()
;;                              (interactive)
;;                              (scroll-down 1)))
;; (global-set-key [mouse-5] '(lambda ()
;;                              (interactive)
;;                              (scroll-up 1)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

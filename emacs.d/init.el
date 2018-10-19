(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;(package-refresh-contents)

(setq package-list
      '(better-defaults
        color-theme-sanityinc-solarized
        exec-path-from-shell
        fill-column-indicator
        company
        company-go
        paredit
        smex
        go-mode))

;(dolist (package package-list) (unless (package-installed-p package) (package-install package)))

(setq company-tooltip-limit 10)                      ; bigger popup window
(setq company-idle-delay .5)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(setq tab-width 4)

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)
            (local-set-key (kbd "C-c C-k") #'pop-tag-mark)))

(require 'better-defaults)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-hl-line-mode t)
(global-linum-mode t)
(column-number-mode t)
(set-face-attribute 'default nil :height 160)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'before-save-hook #'gofmt-before-save)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(flycheck-disabled-checkers (quote (go-golint)))
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
    (smex paredit flycheck fill-column-indicator exec-path-from-shell company-go better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path "/Users/ycding/.emacs.d/local/emacs-color-theme-solarized")
(load-theme 'solarized t)

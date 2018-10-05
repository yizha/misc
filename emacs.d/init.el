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
        paredit
        smex
        go-mode))

;(dolist (package package-list) (unless (package-installed-p package) (package-install package)))

(add-to-list 'custom-theme-load-path "/Users/ycding/.emacs.d/local/emacs-color-theme-solarized")
(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

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
  (exec-path-from-shell-initialize))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'before-save-hook #'gofmt-before-save)

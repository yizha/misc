(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "/Users/yizha/.emacs.d/elpa/use-package-2.4")
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

(setq tab-width 4)
(global-hl-line-mode t)
(global-linum-mode t)
(column-number-mode t)

(use-package better-defaults)

(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(use-package go-mode
  :defer t
  :mode ("\\.go\\'" . go-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :commands company-lsp)

;; Optional - provides snippet support.
(use-package yasnippet
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(add-to-list 'custom-theme-load-path "/Users/yizha/.emacs.d/local/emacs-color-theme-solarized")
(load-theme 'solarized t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet use-package smex paredit lsp-ui flycheck fill-column-indicator exec-path-from-shell company-lsp color-theme-sanityinc-solarized better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

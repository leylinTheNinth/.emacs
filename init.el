;; Initialize package system
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                        ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Install and configure exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(require 'use-package)
(setq use-package-always-ensure t)

;; Mac-specific settings
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq mac-control-modifier 'control)
  (setq ns-function-modifier 'hyper))

;; Your custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" "16e7c7811fd8f1bc45d17af9677ea3bd8e028fce2dd4f6fa5e6535dea07067b1" default))
 '(eshell-scroll-to-bottom-on-input 'this)
 '(package-selected-packages '(elpy jedi-direx gruber-darker-theme smex))
 '(shell-file-name "/bin/bash"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Basic UI configuration
(global-display-line-numbers-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)  ; Disable visible scrollbar

;; Font configuration
;; Try to use Menlo (Mac default), fallback to Monaco, then any monospace
(set-frame-font "Menlo-16" nil t)
(add-to-list 'default-frame-alist '(font . "Menlo-16"))

;; IDO mode configuration
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Smex configuration
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))

;; Buffer management
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Theme
(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

;; Python development setup
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; Backup files settings
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save-list/" t)))

;; Show matching parentheses
(show-paren-mode 1)

;; Delete selection mode
(delete-selection-mode 1)

;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

;; Electric pair mode (auto-closing brackets)
(electric-pair-mode 1)

;; MacOS specific PATH
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

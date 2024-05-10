(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("16e7c7811fd8f1bc45d17af9677ea3bd8e028fce2dd4f6fa5e6535dea07067b1" default))
 '(eshell-scroll-to-bottom-on-input 'this)
 '(package-selected-packages '(elpy jedi-direx gruber-darker-theme smex))
 '(shell-file-name "/bin/bash"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Enable line numbers
(global-display-line-numbers-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; removing menu bar
(menu-bar-mode 0)
;; removing tool bar
(tool-bar-mode 0)
;; setting different font
(set-frame-font "Ubuntu Mono 18" nil t)

;; setting ido mode
(require 'ido)
(ido-mode t)

;; adding melpa for additional packages other than elpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; for smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

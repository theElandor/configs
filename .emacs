;; (use-package elpy
;;   :ensure t
;;   :defer t
;;   :init
;;   (advice-add 'python-mode :before 'elpy-enable))
(setq ring-bell-function 'ignore)
(blink-cursor-mode 0)
(setq-default tab-width 4)
(require 'display-line-numbers)
(add-hook 'python-mode-hook 'display-line-numbers-mode)

(global-set-key (kbd "C-c C-m") 'comment-region)
;; keybinds uncomment-region
(global-set-key (kbd "C-c C-n") 'uncomment-region)
(set-default 'truncate-lines t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(manoj-dark))
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default))
 '(package-selected-packages '(monokai-theme company elpy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(keyboard-translate ?\C-h ?\C-?)

(defun my-python-mode-setup ()
  "Set up Python mode with custom keybindings and tab-based indentation."
  ;; Use tabs for indentation
  (setq indent-tabs-mode t)       ;; Use tabs instead of spaces
  (setq python-indent-offset 4)   ;; Logical indentation level of 4
  (setq tab-width 4)              ;; Tab character width of 4 spaces

  ;; Custom keybindings for indentation
  (define-key python-mode-map (kbd "M-<right>") 'python-indent-shift-right)
  (define-key python-mode-map (kbd "M-<left>") 'python-indent-shift-left))

;; Apply the setup function only to Python mode
(add-hook 'python-mode-hook 'my-python-mode-setup)


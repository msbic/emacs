
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(desktop-save-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 3)


(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (fsharp-mode omnisharp smartparens popup-imenu popup-complete dtrt-indent iedit async company ggtags yasnippet auto-complete which-key use-package robe ruby-hash-syntax ruby-tools ruby-end rubocop ruby-electric ruby-compilation projectile enh-ruby-mode rust-mode irony haskell-mode haskell-emacs-text haskell-emacs-base ctags clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'auto-complete-config)
 (add-to-list 'ac-dictionary-directories
     "d:/Users/t0161597/AppData/Roaming/.emacs.d/elpa/auto-complete-1.5.1/dict")
 (ac-config-default)
 (setq ac-ignore-case nil)
 (add-to-list 'ac-modes 'enh-ruby-mode)
 (add-to-list 'ac-modes 'web-mode)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; small interface tweaks
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

;; bring up help for key bindings
(use-package which-key
  :ensure t 
  :config
  (which-key-mode))


;; Auto completion
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))


;; on the fly syntax checking
;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))

;; snippets and snippet expansion
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; tags for code navigation
(use-package ggtags
  :ensure t
  :config 
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
  )



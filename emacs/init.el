(require 'package)

(ido-mode 1)

;; optional. makes unpure packages archives unavailable
(setq packages-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; load evil
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config ;; tweak evil after loading it
  (evil mode))
;; example how to map a command in normal mode (called 'normal state' in evil)
;;(define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit))

(custom-set-faces
  ;; custom-set-variables added by Custom.
  ;; If you edit it by hand, you coould mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(default ((t (:famili "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 120 :width normal)))))

;; optional: this is the evil state that evil-magit will use
(setq evil-magit-state 'normal)

;; optional: disable additional bindings for yanking text
(setq evil-magit-use-y-for-yank nil)
(require 'evil-magit)

(require 'idris-mode)

(set-face-attribute 'default nil
                    :family "Hasklig"
                    :height 200
                    :weight 'normal
                    :width 'normal)

(use-package hasklig-mode
  :hook (idris-mode))

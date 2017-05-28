;; customize emacs ui
;;
;; Copyright (C) 2017 yanyg<yygcode@gmail.com>
;;

;; Part 1: UI
;; inhibits the startup screen
;; Call C-h / to see the manual when you need
(setq-default inhibit-splash-screen t)
(global-set-key (kbd "C-h /") (lambda() (interactive) (display-splash-screen)))

;; hide menu-bar and tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1)
  ;; full screen for X
  (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (load-theme 'monokai t))

;;(add-hook 'after-startup-hook 'toggle-frame-fullscreen)
;;(w32-send-sys-command ?\u00f030)

;; Part 2: Backup
(setq-default make-backup-files nil)
(setq-default cursor-type 'bar)

;; Part 3: Default behavior like as other editors
(delete-selection-mode t)

;; Part 4: recentf mode
(require 'recentf)
(recentf-mode 1)

;; Part 5: company and parenthesis
;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.4)
;; config smartparens
;; https://github.com/Fuco1/smartparens
(require 'smartparens-config)
;;(smartparens-mode t)
(smartparens-global-mode t)
(show-paren-mode t)

;; Part 6: 80 col Ruler
(require 'fill-column-indicator)
(setq fci-rule-column 81)
(setq fci-rule-color "cyan")
;;(setq fci-rule-character-color "red")
(setq fci-rule-character-color "cyan")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; Part 7: Fonts
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Part 8: use counsel to open file and describe
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;(counsel-company)
;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; Part 9: font config
;;(set-frame-font "Courier New-18" t t)
(set-frame-font "DejaVuSansMono-16" t t)

(setq default-directory "~/")

;; input
(setq pyim-page-length 9)
(setq pyim-page-tooltip 'pos-tip)
(setq pyim-page-style 'one-line)

(global-set-key [C-1] '(delete-other-windows))
(global-set-key (kbd "M-=") 'er/expand-region)

(org-bullets-mode t)
(setq org-hide-leading-stars t)

(global-flycheck-mode t)

(provide 'init-basic)
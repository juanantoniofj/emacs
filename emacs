
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))
(set-foreground-color "white")
(set-mouse-color "goldenrod")
(set-face-background 'region "blue")
(set-face-attribute 'default nil :height 100)
(set-background-color "black")
(set-face-foreground 'minibuffer-prompt "white")
(setq global-font-lock-mode 1)
(setq c-set-style "stroustrup")
(setq c-default-style "stroustrup")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq inhibit-startup-message t)
(column-number-mode t)

(setq cursor-type 'box)
;; scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(global-set-key (kbd "<f2>") 'list-buffers)
(global-set-key (kbd "<f5>") 'compile)

(set-face-attribute  'mode-line
                     nil
                     :foreground "gray80"
                     :background "gray25"
                     :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                     nil
                     :foreground "gray34"
                     :background "white"
                     :box '(:line-width 1 :style released-button))

;; Carga conf-mode si el fichero es .gpj
(add-to-list 'auto-mode-alist '("\\.gpj\\'" . conf-mode))

;; Acepta 'y' o 'n' en lugar de 'yes' o 'no' como respuesta a preguntas
(fset 'yes-or-no-p 'y-or-n-p)
      
; C mode                                                                                                                                                                           
(add-hook 'c-mode-common-hook
          (lambda ()
            (define-key c-mode-map [(ctrl tab)] 'complete-tag)))
(define-key global-map [f8] 'compile)
                                                                                                                                                                                   
; Window control
(defun select-next-window ()
  "Switch to the next window"
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))
                                                                                                                                                                                   
(global-set-key (kbd "M-<right>") 'select-next-window)
(global-set-key (kbd "M-<left>")  'select-previous-window)

;; Carga gtags-mode por defecto cuando se edita en C
(setq c-mode-hook
      '(lambda ()
          (gtags-mode 1) ))

(setq c++-mode-hook
      '(lambda ()
          (gtags-mode 1) ))


;; C-. para gtags-find-rtag
(global-set-key [(control .)] 'gtags-find-rtag)
(put 'upcase-region 'disabled nil)

;; Javascript
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(defun my-js2-mode-hook ()
  (define-key js2-mode-map (kbd "C-c c") 'js2-mode-hide-functions)
  (define-key js2-mode-map (kbd "C-c s") 'js2-mode-show-all)
)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)


;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(global-set-key (kbd "C-c -") 'shrink-window)
(global-set-key (kbd "C-c +") 'enlarge-window)
(global-set-key (kbd "C-c <down>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <up>") 'enlarge-window-horizontally)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (solidity-mode company-irony irony yasnippet yaml-mode rjsx-mode markdown-mode lua-mode less-css-mode json-mode jgraph-mode direx company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#999999"))))
 '(company-scrollbar-fg ((t (:background "#555555"))))
 '(company-tooltip ((t (:background "#cccccc" :foreground "black"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'after-init-hook 'global-company-mode)

(require 'color)
  
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     '(company-tooltip ((t (:background "#cccccc" :foreground "black"))))
     '(company-scrollbar-bg ((t (:background "#999999"))))
     '(company-scrollbar-fg ((t (:background "#555555"))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; set up ido mode
(require `ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; set up org mode
(setq org-directory "~/org")

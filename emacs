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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (rjsx-mode yaml-mode swift-mode scala-mode less-css-mode jsx-mode json-mode js2-mode handlebars-mode go-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo")))))

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


(global-set-key (kbd "C-c -") 'shrink-window)
(global-set-key (kbd "C-c +") 'enlarge-window)
(global-set-key (kbd "C-c <right>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <left>") 'enlarge-window-horizontally)

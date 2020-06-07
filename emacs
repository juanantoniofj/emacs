;(set-foreground-color "white")
(set-mouse-color "goldenrod")
;(set-face-background 'region "blue")
(set-face-attribute 'default nil :height 80)
;(set-background-color "white")
;(set-face-foreground 'minibuffer-prompt "white")
(setq global-font-lock-mode 1)
(setq c-set-style "stroustrup")
(setq c-default-style "stroustrup")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(setq inhibit-startup-message t)
(column-number-mode t)
(menu-bar-mode -1)
(global-set-key (kbd "C-x C-f") 'ffap)

(setq cursor-type 'box)

;; scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step            1
      scroll-conservatively  10000)

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

(fset 'yes-or-no-p 'y-or-n-p)

;; C mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (define-key c-mode-map [(ctrl tab)] 'complete-tag)))
(define-key global-map [f8] 'compile)

;; Window control
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

;; C-. para gtags-find-rtag
(global-set-key [(control .)] 'gtags-find-rtag)
(put 'upcase-region 'disabled nil)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))
(require 'prettier-js)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("a41b81af6336bd822137d4341f7e16495a49b06c180d6a6417bf9fd1001b6d2b" "55c2069e99ea18e4751bd5331b245a2752a808e91e09ccec16eb25dadbe06354" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default)))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (js-doc docker-compose-mode dockerfile-mode dracula-theme solarized-theme company-box lsp-ui ccls gnu-elpa-keyring-update company-lsp lsp-mode graphql-mode json-mode tide tern-auto-complete tern emmet-mode prettier-js-mode add-node-modules-path sr-speedbar company-irony ac-html go-mode polymode js3-mode web-mode ng2-mode lit-mode multi-web-mode vue-mode mmm-mode rjsx-mode indium js2-mode markdown-mode column-enforce-mode fill-column-indicator flycheck company-web company-ebdb company javap-mode yaml-mode auto-complete)))
 '(safe-local-variable-values
   (quote
    ((eval\.
      (prettier-js-mode -1))
     (eval\.
      (prettier-js-mode 0))
     (prettier-js-mode 0)
     (prettier-js-mode . 0)
     (js-indent-level . 4)
     (web-mode-code-indent-offset 4)
     (indent-tabs-mode nil)
     (web-mode-indent-style 4)
     (indent-tabs-mode \.nil)
     (web-mode-indent-style . 4)
     (standard-indent 4)
     (js2-basic-offset 4)
     (js-indent-level 4)
     (tab-width 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Highlight columns beyond 80 in web-mode and java-mode
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(setq css-indent-offset 2)
(setq-default js2-basic-offset 2
              js-indent-level 2
              tab-width 2
              standard-indent 2
              web-mode-indent-style 2
              web-mode-code-indent-offset 2
              )

(add-hook 'web-mode-hook 'whitespace-mode)
(add-hook 'java-mode-hook 'whitespace-mode)

(setq org-todo-keywords
      '((sequence "TODO(t)" "WIP(w)" "DONE(d)" "CANCELED(c)")))

(require 'flycheck)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))

;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'add-node-modules-path)

(defun web-mode-init-prettier-hook ()
  (add-node-modules-path)
  (prettier-js-mode))
(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)
(add-hook 'web-mode-hook  'emmet-mode)

;;; tern
;; (require 'tern)
;; (add-hook 'web-mode-hook (lambda () (tern-mode t)))

;; (require 'company-tern)
;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-tern))

;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))

;;; sr-speedbar
(add-hook 'speedbar-mode-hook
          '(lambda ()
             (hl-line-mode 1)
             (visual-line-mode -1)
;;             (setq automatic-hscrolling nil)
             (setq truncate-lines t)
             (let ((speedbar-display-table (make-display-table)))
               (set-display-table-slot speedbar-display-table 0 8230)
               (setq buffer-display-table speedbar-display-table))
             ))
(add-hook 'speedbar-reconfigure-keymaps-hook
          '(lambda ()
             (define-key speedbar-mode-map [S-up] #'speedbar-up-directory)
             (define-key speedbar-mode-map [right] #'speedbar-flush-expand-line)
             (define-key speedbar-mode-map [left] #'speedbar-contract-line)))
;; (add-hook 'emacs-startup-hook (lambda ()
;;                                 (sr-speedbar-open)
;;                                 ))
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-right-side nil)

(windmove-default-keybindings)

(add-hook 'after-init-hook 'global-company-mode)

;;;;;;; TYPESCRIPT
(use-package tide :diminish t)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  ;; (flycheck-add-next-checker 'typescript-tide '(t . typescript-tslint) 'append)
  (flycheck-add-next-checker 'typescript-tide
                             'typescript-tslint)
  (flycheck-mode)
  (prettier-js-mode)
  (eldoc-mode)
  (company-mode)
  (set (make-local-variable 'company-backends)
         '((company-tide company-files :with company-yasnippet)
           (company-dabbrev-code company-dabbrev)))
  (tide-hl-identifier-mode +1)
  (setq tide-completion-detailed t)
  (setq typescript-indent-level 2)  
  (add-hook 'tide-mode-hook
            (lambda ()
              (add-hook 'kill-buffer-hook #'+javascript|cleanup-tide-processes nil t)))
  )

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'typescript-mode-hook
	        (lambda ()
		        (when (string-equal "tsx" (file-name-extension buffer-file-name))
		          (setup-tide-mode))))
;; funky typescript linting in web-mode
;;(flycheck-add-mode 'typescript-tslint 'web-mode)

;;; TSX
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;;; JSX
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "js" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;; C++
(use-package lsp-mode :commands lsp :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends))

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))


(set-default-font "Menlo 14")
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(load-theme 'dracula t)
(tool-bar-mode -1)
(menu-bar-mode 1)

(setq ring-bell-function 'ignore)
(setq mac-command-modifier 'none
      mac-option-modifier 'meta
      mac-right-option-modifier 'none
      select-enable-clipboard t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


(setq package-enable-at-startup nil)
(setq-default indent-tabs-mode nil)
;; window config
(windmove-default-keybindings)
(winner-mode 1)

;;(xterm-mouse-mode 1)
(defalias 'list-buffers 'ibuffer) ; make ibuffer default
(setq vc-follow-symlinks t)


(xterm-mouse-mode t)
(global-set-key [mouse-5] 'next-line)
(global-set-key [mouse-4] 'previous-line)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package magit
  :ensure t
  :init
  (add-hook 'after-save-hook 'magit-after-save-refresh-status)
  :config
  (global-magit-file-mode 1)
  )

(use-package auto-complete
  :ensure t
  :config
    (ac-config-default)
    (global-auto-complete-mode t)
  )

;; (use-package avy
;;   :ensure t
;;   :config
;;   (avy-setup-default))

(use-package company
  :ensure t
  ;; :config
  ;; (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package company-go
  :ensure t)

(use-package helm
  :ensure t
  :config (helm-mode 1)
  :bind
  ("M-x" . helm-M-x)
  ("C-x r b" . helm-filtered-bookmarks)
  ("C-x C-f" . helm-find-files)
  )

(use-package helm-ag
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'helm))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  )

(use-package go-mode
  :ensure t
  :init
    (setq gofmt-command "goreturns")
    (add-hook 'before-save-hook 'gofmt-before-save)
  :bind (:map go-mode-map
              ("C-c C-r" . go-remove-unused-imports)
              ("C-c C-g" . go-goto-imports)
              ("C-c C-f" . gofmt)
              ("C-c C-k" . godoc)
              ("M-." . godef-jump)
              ("M-*" . pop-tag-mark)
              )
  :config
  (add-hook 'go-mode-hook (lambda ()
                            (auto-complete-mode -1)
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))
  (setq compile-command "go build -v && go test -v && go vet")
  )

(use-package go-rename
  :ensure t)

(use-package go-guru
  :ensure t)


(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  )

(use-package markdown-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package swiper
  :ensure t
  :bind
  ("C-s" . swiper)
  )

(use-package  multiple-cursors
  :ensure t
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C-x a n" . mc/mark-next-like-this)
  ("C-x a p" . mc-/mark-previous-like-this)
  ("C-x a a" . mc-/mark-all-like-this)
  )

(use-package try
  :ensure t)

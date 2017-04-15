;;; packages.el --- rogue Layer packages File for Spacemacs

(setq rogue-packages
      '(all-the-icons
        beacon
        bm
        browse-at-remote
        counsel
        counsel-projectile
        cricbuzz
        doom-themes
        enlive
        flycheck-mypy
        hackernews
        helm-bm
        helm-org-rifle
        (kde :location (recipe :fetcher github :repo "lepisma/kde.el"))
        magithub
        multiple-cursors
        nlinum
        ob-async
        org-journal
        pretty-mode
        (read-lyrics :location (recipe :fetcher github :repo "lepisma/read-lyrics.el"))
        snakemake-mode
        (spaceline-all-the-icons :location local)
        swiper
        sx
        tide
        tldr
        vue-mode
        wolfram
        writegood-mode
        writeroom-mode
        wttrin))

;; Initialize packages
(defun rogue/init-all-the-icons ()
  (use-package all-the-icons))

(defun rogue/init-beacon ()
  :config
  (beacon-mode +1)
  (setq beacon-color (face-attribute 'region :background nil t)
        beacon-blink-when-buffer-changes t
        beacon-blink-when-point-moves-vertically 10))

(defun rogue/init-bm ()
  (use-package bm
    :demand t
    :init
    (setq bm-restore-repository-on-load t)
    (setq bm-repository-file "~/.emacs.d/.cache/bm-repository")
    :config
    (setq bm-cycle-all-buffers t)
    (setq-default bm-buffer-persistence t)
    (add-hook 'after-init-hook 'bm-repository-load)
    (add-hook 'kill-buffer-hook 'bm-buffer-save)
    (add-hook 'kill-emacs-hook (lambda ()
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))
    (add-hook 'after-save-hook 'bm-buffer-save)
    (add-hook 'find-file-hook 'bm-buffer-restore)
    (add-hook 'after-revert-hook 'bm-buffer-restore)
    (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
    :bind (("C-c b t" . bm-toggle)
           ("C-c b <right>" . bm-next)
           ("C-c b <left>" . bm-previous))))

(defun rogue/init-browse-at-remote ()
  (use-package browse-at-remote
    :defer t))

(defun rogue/init-counsel ()
  (use-package counsel
    :demand t))

(defun rogue/init-counsel-projectile ()
  (use-package counsel-projectile
    :after counsel
    :bind ("C-c g" . counsel-projectile-ag)))

(defun rogue/init-cricbuzz ()
  (use-package cricbuzz
    :defer t))

(defun rogue/init-doom-themes ()
  (use-package doom-themes
    :after nlinum
    :config
    (setq doom-neotree-enable-variable-pitch t
          doom-neotree-file-icons 'simple
          doom-neotree-line-spacing 4)
    (setq doom-enable-bold t
          doom-enable-italic t)
    (setq org-fontify-whole-heading-line t
          org-fontify-done-headline t
          org-fontify-quote-and-verse-blocks t)
    (add-hook 'find-file-hook 'doom-buffer-mode-maybe)
    (add-hook 'after-revert-hook 'doom-buffer-mode-maybe)
    (add-hook 'ediff-prepare-buffer-hook 'doom-buffer-mode)
    (require 'doom-neotree)
    (require 'doom-nlinum)))

(defun rogue/init-enlive ()
  (use-package enlive))

(defun rogue/init-flycheck-mypy ()
  (use-package flycheck-mypy
    :init
    (add-hook 'python-mode-hook (lambda () (setq flycheck-checker 'python-mypy)))))

(defun rogue/init-hackernews ()
  (use-package hackernews
    :bind ("C-c h" . hackernews)))

(defun rogue/init-helm-bm ()
  (use-package helm-bm
    :after bm
    :defer t))

(defun rogue/init-helm-org-rifle ()
  (use-package helm-org-rifle
    :bind ("C-c r" . helm-org-rifle-agenda-files)))

(defun rogue/init-kde ()
  (use-package kde
    :bind (("C-c k a" . kde-kalarm-set-org)
           ("C-c k s" . kde-kmail-send-default)
           ("C-c k x" . kde-explore))))

(defun rogue/init-magithub ()
  (use-package magithub
    :after magit
    :config (magithub-feature-autoinject t)))

(defun rogue/init-multiple-cursors ()
  (use-package multiple-cursors
    :bind (("C->" . mc/mark-next-like-this)
           ("C-<" . mc/mark-previous-like-this)
           ("C-M-<mouse-1>" . mc/add-cursor-on-click))))

(defun rogue/init-nlinum ()
  (use-package nlinum
    :demand t
    :config
    (add-hook 'prog-mode-hook 'nlinum-mode)
    (setq nlinum-format " %d ")))

(defun rogue/init-ob-async ()
  (use-package ob-async
    :config
    (add-to-list 'org-ctrl-c-ctrl-c-hook 'ob-async-org-babel-execute-src-block)))

(defun rogue/init-org-journal ()
  (use-package org-journal
    :config
    (setq org-journal-dir user-diary-dir)
    (setq org-journal-enable-encryption t)))

(defun rogue/init-pretty-mode ()
  (use-package pretty-mode
    :config
    (global-pretty-mode t)
    (global-prettify-symbols-mode 1)

    (pretty-deactivate-groups
     '(:equality
       :ordering
       :ordering-double
       :ordering-triple
       :arrows
       :arrows-twoheaded
       :punctuation
       :logic
       :sets
       :sub-and-superscripts
       :subscripts
       :arithmetic-double
       :arithmetic-triple))

    (pretty-activate-groups
     '(:greek :arithmetic-nary))))

(defun rogue/init-read-lyrics ()
  (use-package read-lyrics
    :commands (read-lyrics-read-lyrics)))

(defun rogue/init-snakemake-mode ()
  (use-package snakemake-mode
    :defer t))

(defun rogue/init-spaceline-all-the-icons ()
  (progn
    (use-package spaceline-all-the-icons
      :after spaceline)
    (use-package spaceline
      :after powerline
      :config (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))))

(defun rogue/init-swiper ()
  (use-package swiper
    :bind (("C-s" . swiper)
           ("C-r" . swiper))))

(defun rogue/init-sx ()
  (use-package sx
    :defer t))

(defun rogue/init-tide ()
  (use-package tide
    :mode ("\\.ts\\'" . typescript-mode)
    :config (setq-default typescript-indent-level 2)))

(defun rogue/init-tldr ()
  (use-package tldr
    :defer t))

(defun rogue/init-vue-mode ()
  (use-package vue-mode
    :mode ("\\.vue\\'" . vue-mode)))

(defun rogue/init-wolfram ()
  (use-package wolfram
    :defer t
    :config
    (require 'json)
    (let* ((json-object-type 'hash-table)
           (secrets (json-read-file user-secrets-path)))
      (setq wolfram-alpha-app-id
            (gethash "wolfram-alpha-app-id" secrets)))))

(defun rogue/init-writegood-mode ()
  (use-package writegood-mode
    :defer t))

(defun rogue/init-writeroom-mode ()
  (use-package writeroom-mode
    :defer t))

(defun rogue/init-wttrin ()
  (use-package wttrin
    :defer t
    :config
    (setq wttrin-default-cities '("Amherst?m" "Varanasi?m"))))

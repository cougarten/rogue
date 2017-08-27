;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(;; Pure languages
     c-c++
     common-lisp
     emacs-lisp
     ess
     haskell
     html
     javascript
     python
     racket
     ruby
     scheme
     typescript
     ;; Other languages / assists
     bibtex
     csv
     graphviz
     (latex :variables
            latex-enable-folding t
            latex-enable-auto-fill t)
     (markdown :variables markdown-live-preview-engine 'vmd)
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t)
     shell
     shell-scripts
     sql
     yaml
     ;; Everything else
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.emacs.d/private/rogue/snippets")
     better-defaults
     colors
     (elfeed :variables
             rmh-elfeed-org-files '("~/.emacs.d/private/rogue/feeds.org")
             elfeed-enable-web-interface t)
     emoji
     git
     github
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     imenu-list
     (mu4e :variables mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")
     nlinum
     pandoc
     pdf-tools
     prodigy
     (ranger :variables ranger-show-preview t)
     restclient
     rogue
     slack
     (spell-checking :variables spell-checking-enable-by-default nil)
     spotify
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     theming
     typography
     (version-control :variables
                      version-control-diff-tool 'git-gutter
                      version-control-global-margin t
                      version-control-diff-side 'left)
     xkcd)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style '(hybrid :variables
                                       hybrid-mode-default-state 'hybrid)
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-molokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight regular
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Directories
  (defconst user-layer-dir (file-name-as-directory "~/.emacs.d/private/rogue"))
  (defconst user-secrets-dir (file-name-as-directory (concat user-layer-dir "secrets")))
  (defconst user-journal-dir (file-name-as-directory (getenv "JOURNAL_DIR")))
  (defconst user-diary-dir (file-name-as-directory (concat user-journal-dir "diary")))
  (defconst user-project-dir (file-name-as-directory (getenv "PROJECTS_DIR")))

  (defconst user-project-file (concat user-project-dir "dev/projects.org"))
  (defconst user-books-file (concat user-project-dir "reading-list/reading-list.org"))
  (defconst user-bookmarks-file (concat user-journal-dir "bookmarks.org"))
  (defconst user-gcal-file (concat user-journal-dir "gcal.org"))
  ;; Separate custom stuff
  (setq custom-file "~/.emacs-custom.el")
  (load custom-file))
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."

  ;; Colors
  (setq rogue-current-color 'dark)

  ;; Fira Code ligatures
  ;; This works when using emacs --daemon + emacsclient
  (add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
  ;; This works when using emacs without server/client
  (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
  (defconst fira-code-font-lock-keywords-alist
    (mapcar (lambda (regex-char-pair)
              `(,(car regex-char-pair)
                (0 (prog1 ()
                     (compose-region (match-beginning 1)
                                     (match-end 1)
                                     ;; The first argument to concat is a string containing a literal tab
                                     ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
            '(("[^=]\\(:=\\)"                #Xe10c)
              ("\\(!=\\)"                    #Xe10e)
              ("\\(!==\\)"                   #Xe10f)
              ("\\(-->\\)"                   #Xe113)
              ("[^-]\\(->\\)"                #Xe114)
              ("\\(->>\\)"                   #Xe115)
              ("\\(-<\\)"                    #Xe116)
              ("\\(-<<\\)"                   #Xe117)
              ("\\(-~\\)"                    #Xe118)
              ("\\(#{\\)"                    #Xe119)
              ("\\(#\\[\\)"                  #Xe11a)
              ("\\(##\\)"                    #Xe11b)
              ("\\(###\\)"                   #Xe11c)
              ("\\(####\\)"                  #Xe11d)
              ("\\(#(\\)"                    #Xe11e)
              ("\\(#\\?\\)"                  #Xe11f)
              ("\\(#_\\)"                    #Xe120)
              ("\\(#_(\\)"                   #Xe121)
              ("\\(\\.-\\)"                  #Xe122)
              ("\\(\\.=\\)"                  #Xe123)
              ("\\(\\?=\\)"                  #Xe127)
              ("\\(/=\\)"                    #Xe12c)
              ("\\(/==\\)"                   #Xe12d)
              ("\\(/>\\)"                    #Xe12e)
              ("\\(&&\\)"                    #Xe131)
              ("\\(||\\)"                    #Xe132)
              ("\\(||=\\)"                   #Xe133)
              ("[^|]\\(|=\\)"                #Xe134)
              ("\\(|>\\)"                    #Xe135)
              ("\\(\\^=\\)"                  #Xe136)
              ("\\(\\$>\\)"                  #Xe137)
              ("\\(\\+>\\)"                  #Xe13a)
              ("\\(=:=\\)"                   #Xe13b)
              ("[^!/]\\(==\\)[^>]"           #Xe13c)
              ("\\(===\\)"                   #Xe13d)
              ("\\(==>\\)"                   #Xe13e)
              ("[^=]\\(=>\\)"                #Xe13f)
              ("\\(=>>\\)"                   #Xe140)
              ("\\(<=\\)"                    #Xe141)
              ("\\(=<<\\)"                   #Xe142)
              ("\\(=/=\\)"                   #Xe143)
              ("\\(>-\\)"                    #Xe144)
              ("\\(>=\\)"                    #Xe145)
              ("\\(>=>\\)"                   #Xe146)
              ("[^-=]\\(>>\\)"               #Xe147)
              ("\\(>>-\\)"                   #Xe148)
              ("\\(>>=\\)"                   #Xe149)
              ("\\(>>>\\)"                   #Xe14a)
              ("\\(<\\*\\)"                  #Xe14b)
              ("\\(<\\*>\\)"                 #Xe14c)
              ("\\(<|\\)"                    #Xe14d)
              ("\\(<|>\\)"                   #Xe14e)
              ("\\(<!--\\)"                  #Xe151)
              ("\\(<-\\)"                    #Xe152)
              ("\\(<--\\)"                   #Xe153)
              ("\\(<->\\)"                   #Xe154)
              ("\\(<\\+\\)"                  #Xe155)
              ("\\(<\\+>\\)"                 #Xe156)
              ("\\(<=\\)"                    #Xe157)
              ("\\(<==\\)"                   #Xe158)
              ("\\(<=>\\)"                   #Xe159)
              ("\\(<=<\\)"                   #Xe15a)
              ("[^-=]\\(<<\\)"               #Xe15c)
              ("\\(<<-\\)"                   #Xe15d)
              ("\\(<<=\\)"                   #Xe15e)
              ("\\(<<<\\)"                   #Xe15f)
              ("\\(<~\\)"                    #Xe160)
              ("\\(<~~\\)"                   #Xe161)
              ("\\(</\\)"                    #Xe162)
              ("\\(</>\\)"                   #Xe163)
              ("\\(~@\\)"                    #Xe164)
              ("\\(~-\\)"                    #Xe165)
              ("\\(~=\\)"                    #Xe166)
              ("\\(~>\\)"                    #Xe167)
              ("[^<]\\(~~\\)"                #Xe168)
              ("\\(~~>\\)"                   #Xe169)
              ("[^:=]\\(:\\)[^:=]"           #Xe16c)
              ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
              ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

  (defun add-fira-code-symbol-keywords ()
    (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))
  (add-hook 'prog-mode-hook 'add-fira-code-symbol-keywords)
  (add-hook
   'python-mode-hook
   (lambda ()
     (mapc (lambda (pair) (push pair prettify-symbols-alist))
           '(("in"       . #x2208)
             ("not in"   . #x2209)
             ("return"   . #x27fc)
             ("yield"    . #x27fb)
             ("for"      . #x2200)
             ("int"      . #x2124)
             ("float"    . #x211d)
             ("True"     . #x1d54b)
             ("False"    . #x1d53d)))))
  (add-hook
   'ess-mode-hook
   (lambda ()
     (progn
       (pretty-mode -1)
       (push '("%>%" . ?|) prettify-symbols-alist))))
  (add-hook
   'inferior-ess-mode-hook
   (lambda ()
     (progn
       (pretty-mode -1)
       (push '("%>%" . ?|) prettify-symbols-alist))))

  (setq wdired-allow-to-change-permissions t)

  ;; Smaller fonts in echo area
  (with-current-buffer (get-buffer " *Echo Area 0*")
    (setq-local face-remapping-alist '((default (:height 0.9) ))))
  (add-hook 'minibuffer-setup-hook
            (lambda ()
              (set (make-local-variable 'face-remapping-alist) '((default :height 0.9)))))

  (blink-cursor-mode t)
  (setq-default cursor-in-non-selected-windows nil)
  (setq frame-title-format '("" "%b - Emacs"))

  (setq ibuffer-expert t
        ibuffer-show-empty-filter-groups nil
        ibuffer-filter-group-name-face 'org-level-1
        ibuffer-modified-char ?\★
        ibuffer-locked-char ?\-
        ibuffer-read-only-char ?\-
        ibuffer-marked-char ?\✓
        ibuffer-deletion-char ?\✕
        ibuffer-deletion-face 'org-agenda-done
        ibuffer-use-header-line nil)

  (defun ibuffer-remove-title (&rest args)
    (save-excursion
      (set-buffer "*Ibuffer*")
      (toggle-read-only 0)
      (goto-char 1)
      (search-forward "-\n" nil t)
      (delete-region 1 (point))
      (insert "\n")
      (let ((window-min-height 1))
        (shrink-window-if-larger-than-buffer))
      (toggle-read-only)))

  (advice-add 'ibuffer-update-title-and-summary :after 'ibuffer-remove-title)

  (setq neo-banner-message nil
        neo-mode-line-type 'none
        neo-autorefresh nil)

  (setq-default fringes-outside-margins t
                indicate-buffer-boundaries nil
                fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
                                             fringe-indicator-alist))
  (setq flycheck-indication-mode nil)

  (add-hook 'magit-post-refresh-hook 'git-gutter:update-all-windows)
  (define-fringe-bitmap 'git-gutter-fr:added
    [224 224 224 224 224 224 224 224 224 224 224 224 224
         224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
    [224 224 224 224 224 224 224 224 224 224 224 224 224
         224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
    nil nil 'center)
  (fringe-mode 3)

  (setq-default web-mode-markup-indent-offset 2)
  (setq-default web-mode-css-indent-offset 2)
  (setq-default web-mode-code-indent-offset 2)
  (setq-default css-indent-offset 2)

  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-missing-semi-one-line-override nil)

  (setq-default typescript-indent-level 2)

  (use-package em-tramp
    :config
    (setq eshell-prefer-lisp-functions t)
    (setq password-cache t)
    (setq password-cache-expiry 3600))

  (setq eshell-prompt-function
        (lambda ()
          (concat (propertize
                   (abbreviate-file-name (eshell/pwd)) 'face '(:foreground "#727280"))
                  "\nλ ")))

  (setq eshell-scroll-show-maximum-output nil)

  (setq ielm-prompt "λ "
        ielm-prompt-internal "λ ")

  (setq comint-scroll-show-maximum-output nil)
  (setq comint-input-ignoredups t)

  (setq inferior-lisp-program "ros -Q run")
  (slime-setup '(slime-asdf
                 slime-company
                 slime-fancy
                 slime-indentation
                 slime-sbcl-exts
                 slime-scratch
                 slime-tramp))
  (setq alert-default-style 'libnotify)

  ;; Secret
  ;; (slack-register-team
  ;;  :name "<>"
  ;;  :default t
  ;;  :client-id "<>"
  ;;  :client-secret "<>"
  ;;  :token "<>"
  ;;  :subscribed-channels '(<>)) ...
  (load-file (concat user-secrets-dir "slack.el"))

  ;; Delay slack
  (run-at-time "120 sec" nil 'slack-start)

  (setq tramp-default-method "ssh")

  (setq ranger-cleanup-on-disable t
        ranger-show-hidden t
        ranger-parent-depth 2
        ranger-width-preview 0.60
        ranger-width-parents 0.15
        ranger-modify-header t
        ranger-max-preview-size 5
        ranger-dont-show-binary t)
  (ranger-override-dired-mode t)
  (setq ranger-header-func (lambda () ""))

  (setq nlinum-format " %d ")

  ;; Hooks
  (defun add-hooks (hooks fun)
    "Add FUN to all the HOOKS."
    (dolist (hook hooks)
      (add-hook hook fun)))

  (add-hooks '(cfw:calendar-mode-hook
               text-mode-hook
               org-agenda-mode-hook
               slack-mode-hook
               ibuffer-mode-hook
               magit-status-mode-hook
               magit-popup-mode-hook
               magit-log-mode-hook
               magit-diff-mode-hook
               comint-mode-hook
               eshell-mode-hook
               slime-repl-mode-hook
               process-menu-mode-hook
               mu4e-view-mode-hook
               mu4e-main-mode-hook)
             (lambda () (progn
                     (setq left-margin-width 2)
                     (setq right-margin-width 2)
                     (set-window-buffer nil (current-buffer)))))

  (add-hooks '(cfw:calendar-mode-hook
               text-mode-hook
               org-agenda-mode-hook
               slack-mode-hook
               ibuffer-mode-hook
               magit-status-mode-hook
               magit-log-mode-hook
               magit-diff-mode-hook
               comint-mode-hook
               eshell-mode-hook
               slime-repl-mode-hook
               process-menu-mode-hook
               mu4e-view-mode-hook
               mu4e-main-mode-hook)
             (lambda () (setq header-line-format " ")))

  (add-hooks '(text-mode-hook
               prog-mode-hook
               ranger-mode-hook
               ibuffer-mode-hook
               comint-mode-hook)
             (lambda () (setq line-spacing 0.1)))

  (add-hooks '(org-agenda-mode-hook)
             (lambda () (setq line-spacing 0.2)))

  (add-hooks '(processing-compilation-mode-hook
               eshell-mode-hook
               neo-after-create-hook
               help-mode-hook
               compilation-mode-hook
               messages-buffer-mode-hook
               completion-list-mode-hook
               org-agenda-mode-hook
               ranger-mode-hook
               ibuffer-mode-hook
               magit-status-mode-hook
               magit-popup-mode-hook
               magit-log-mode-hook
               magit-diff-mode-hook
               comint-mode-hook
               ranger-parent-dir-hook
               ranger-preview-dir-hook
               slime-repl-mode-hook
               process-menu-mode-hook)
             'hidden-mode-line-mode)

  (with-current-buffer "*Messages*"
    (hidden-mode-line-mode +1)
    (setq header-line-format " ")
    (setq left-margin-width 2)
    (setq right-margin-width 2)
    (set-window-buffer nil (current-buffer)))

  (advice-add 'helm-display-mode-line
              :override (lambda (source &optional force) (hidden-mode-line-mode +1)))

  (add-hooks '(text-mode-hook
               cfw:calendar-mode-hook)
             (lambda () (spacemacs/disable-hl-line-mode)))

  (add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
  (add-hook 'text-mode-hook (lambda () (auto-fill-mode)))
  (add-hook 'term-mode-hook 'toggle-truncate-lines)
  (add-hook 'prog-mode-hook 'nlinum-mode)

  (setq nlinum-highlight-current-line t)

  ;; Org
  (setq bib-library "~/library.bib")
  (setq reftex-default-bibliography '(bib-library)
        org-ref-default-bibliography '(bib-library)
        bibtex-completion-bibliography bib-library)
  (setq org-latex-pdf-process
        '("pdflatex -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "pdflatex -interaction nonstopmode -output-directory %o %f"
          "pdflatex -interaction nonstopmode -output-directory %o %f"))

  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (js . t)
     (latex . t)
     (python . t)
     (sqlite . t)))

  (setq spaceline-org-clock-p t)

  ;; Auto update projects
  (run-at-time "10 min" 3600
               (lambda ()
                 (mapc #'git-update-project
                       (mapcar (lambda (pn) (concat user-project-dir pn))
                               '("reading-list"
                                 "kindle-highlights"
                                 "til-emacs"
                                 "dev")))))

  ;; Email setup
  (run-at-time "10 min" 1800
               (lambda ()
                 (start-process-shell-command "offlineimap"
                                              "*offlineimap-autorefresh*"
                                              "offlineimap -o")
                 (mu4e-maildirs-extension-force-update)))
  ;; Prodigy services
  (prodigy-define-service
   :name "offlineimap"
   :command "offlineimap"
   :args '("-o")
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)

  (defun mu4e-message-maildir-matches (msg rx)
    (when rx
      (if (listp rx)
          ;; if rx is a list, try each one for a match
          (or (mu4e-message-maildir-matches msg (car rx))
              (mu4e-message-maildir-matches msg (cdr rx)))
        ;; not a list, check rx
        (string-match rx (mu4e-message-field msg :maildir)))))

  (setq user-full-name "Abhinav Tushar")
  (setq mu4e-get-mail-command "offlineimap -o"
        mu4e-update-interval 300
        message-kill-buffer-on-exit t
        mu4e-headers-fields '((:human-date . 12)
                              (:flags      . 12)
                              (:from-or-to . 22)
                              (:maildir    . 15)
                              (:subject))
        mu4e-attachment-dir "~/Downloads/"
        mu4e-view-show-images t)
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))
  (setq mu4e-use-fancy-chars t
        mu4e-headers-draft-mark     '("D" . " ")
        mu4e-headers-flagged-mark   '("F" . " ")
        mu4e-headers-new-mark       '("N" . " ")
        mu4e-headers-passed-mark    '("P" . " ")
        mu4e-headers-replied-mark   '("R" . " ")
        mu4e-headers-seen-mark      '("S" . "")
        mu4e-headers-trashed-mark   '("T" . " ")
        mu4e-headers-attach-mark    '("a" . " ")
        mu4e-headers-encrypted-mark '("x" . " ")
        mu4e-headers-signed-mark    '("s" . " ")
        mu4e-headers-unread-mark    '("u" . " ")
        mu4e-headers-has-child-prefix    '("+"  . " ")
        mu4e-headers-empty-parent-prefix '("-"  . " ")
        mu4e-headers-first-child-prefix  '("\\" . " ")
        mu4e-headers-duplicate-prefix    '("="  . " ")
        mu4e-headers-default-prefix      '("|"  . " "))

  (setq mu4e-marks
        '((refile :char
                  ("r" . "")
                  :prompt "refile" :dyn-target
                  (lambda
                    (target msg)
                    (mu4e-get-refile-folder msg))
                  :action
                  (lambda
                    (docid msg target)
                    (mu4e~proc-move docid
                                    (mu4e~mark-check-target target)
                                    "-N")))
          (delete :char
                  ("D" . "")
                  :prompt "Delete" :show-target
                  (lambda
                    (target)
                    "delete")
                  :action
                  (lambda
                    (docid msg target)
                    (mu4e~proc-remove docid)))
          (flag :char
                ("+" . "")
                :prompt "+flag" :show-target
                (lambda
                  (target)
                  "flag")
                :action
                (lambda
                  (docid msg target)
                  (mu4e~proc-move docid nil "+F-u-N")))
          (move :char
                ("m" . "")
                :prompt "move" :ask-target mu4e~mark-get-move-target :action
                (lambda
                  (docid msg target)
                  (mu4e~proc-move docid
                                  (mu4e~mark-check-target target)
                                  "-N")))
          (read :char
                ("!" . "")
                :prompt "!read" :show-target
                (lambda
                  (target)
                  "read")
                :action
                (lambda
                  (docid msg target)
                  (mu4e~proc-move docid nil "+S-u-N")))
          (trash :char
                 ("d" . "")
                 :prompt "dtrash" :dyn-target
                 (lambda
                   (target msg)
                   (mu4e-get-trash-folder msg))
                 :action
                 (lambda
                   (docid msg target)
                   (mu4e~proc-move docid
                                   (mu4e~mark-check-target target)
                                   "+T-N")))
          (unflag :char
                  ("-" . "")
                  :prompt "-unflag" :show-target
                  (lambda
                    (target)
                    "unflag")
                  :action
                  (lambda
                    (docid msg target)
                    (mu4e~proc-move docid nil "-F-N")))
          (untrash :char
                   ("=" . "")
                   :prompt "=untrash" :show-target
                   (lambda
                     (target)
                     "untrash")
                   :action
                   (lambda
                     (docid msg target)
                     (mu4e~proc-move docid nil "-T")))
          (unread :char
                  ("?" . "")
                  :prompt "?unread" :show-target
                  (lambda
                    (target)
                    "unread")
                  :action
                  (lambda
                    (docid msg target)
                    (mu4e~proc-move docid nil "-S+u-N")))
          (unmark :char " " :prompt "unmark" :action
                  (mu4e-error "No action for unmarking"))
          (action :char
                  ("a" . "◯")
                  :prompt "action" :ask-target
                  (lambda nil
                    (mu4e-read-option "Action: " mu4e-headers-actions))
                  :action
                  (lambda
                    (docid msg actionfunc)
                    (save-excursion
                      (when
                          (mu4e~headers-goto-docid docid)
                        (mu4e-headers-action actionfunc)))))
          (something :char
                     ("*" . "✱")
                     :prompt "*something" :action
                     (mu4e-error "No action for deferred mark"))))

  (add-hook 'mu4e-compose-mode-hook (lambda ()
                                      (org~mu4e-mime-switch-headers-or-body)
                                      (flyspell-mode)))
  (setq org-mu4e-convert-to-html t)

  (setq mu4e-bookmarks (list (make-mu4e-bookmark
                              :name "Unified Inbox"
                              :query (concat "maildir:/Gmail/INBOX OR "
                                             "maildir:/UMassCS/INBOX OR "
                                             "maildir:/UMass/INBOX OR "
                                             "maildir:/Outlook/Inbox")
                              :key ?i)
                             (make-mu4e-bookmark
                              :name "All Unread"
                              :query (concat "maildir:/Gmail/INBOX AND flag:unread OR "
                                             "maildir:/UMassCS/INBOX AND flag:unread OR "
                                             "maildir:/UMass/INBOX AND flag:unread OR "
                                             "maildir:/Outlook/Inbox AND flag:unread")
                              :key ?u)
                             (make-mu4e-bookmark
                              :name "Archived"
                              :query (concat "maildir:/Gmail/[Gmail].Archive OR "
                                             "maildir:/UMassCS/Archive OR "
                                             "maildir:/UMass/INBOX.Archive OR "
                                             "maildir:/Outlook/Archive")
                              :key ?a))
        mu4e-contexts (list (make-mu4e-context
                             :name "Gmail"
                             :match-func (lambda (msg) (when msg
                                                    (mu4e-message-maildir-matches msg "^/Gmail")))
                             :vars '((user-mail-address . "abhinav.tushar.vs@gmail.com")
                                     (smtpmail-default-smtp-server . "smtp.gmail.com")
                                     (smtpmail-smtp-server . "smtp.gmail.com")
                                     (smtpmail-smtp-service . 465)
                                     (smtpmail-stream-type . ssl)
                                     (smtpmail-smtp-user . "abhinav.tushar.vs")
                                     ;; Gmail handles sent mails automatically
                                     (mu4e-sent-messages-behavior . delete)
                                     (mu4e-trash-folder . "/Gmail/[Gmail].Trash")
                                     (mu4e-drafts-folder . "/Gmail/[Gmail].Drafts")
                                     (mu4e-refile-folder . "/Gmail/[Gmail].Archive")))
                            (make-mu4e-context
                             :name "UMassCS"
                             :match-func (lambda (msg) (when msg
                                                    (mu4e-message-maildir-matches msg "^/UMassCS")))
                             :vars '((user-mail-address . "atushar@cs.umass.edu")
                                     (smtpmail-default-smtp-server . "mailsrv.cs.umass.edu")
                                     (smtpmail-smtp-server . "mailsrv.cs.umass.edu")
                                     (smtpmail-smtp-service . 465)
                                     (smtpmail-stream-type . ssl)
                                     (smtpmail-smtp-user . "atushar@cs.umass.edu")
                                     (mu4e-sent-messages-behavior . sent)
                                     (mu4e-sent-folder . "/UMassCS/Sent")
                                     (mu4e-drafts-folder . "/UMassCS/Drafts")
                                     (mu4e-trash-folder . "/UMassCS/Trash")
                                     (mu4e-refile-folder . "/UMassCS/Archive")))
                            (make-mu4e-context
                             :name "UMass"
                             :match-func (lambda (msg) (when msg
                                                    (mu4e-message-maildir-matches msg "^/UMass")))
                             :vars '((user-mail-address . "atushar@umass.edu")
                                     (smtpmail-default-smtp-server . "mail-auth.oit.umass.edu")
                                     (smtpmail-smtp-server . "mail-auth.oit.umass.edu")
                                     (smtpmail-smtp-service . 465)
                                     (smtpmail-stream-type . ssl)
                                     (smtpmail-smtp-user . "atushar")
                                     (mu4e-sent-messages-behavior . sent)
                                     (mu4e-sent-folder . "/UMass/INBOX.Sent")
                                     (mu4e-drafts-folder . "/UMass/INBOX.Drafts")
                                     (mu4e-trash-folder . "/UMass/INBOX.Trash")
                                     (mu4e-refile-folder . "/UMass/INBOX.Archive")))
                            (make-mu4e-context
                             :name "Outlook"
                             :match-func (lambda (msg) (when msg
                                                    (mu4e-message-maildir-matches msg "^/Outlook")))
                             :vars '((user-mail-address . "abhinav.tushar.vs@hotmail.com")
                                     (smtpmail-default-smtp-server . "smtp-mail.outlook.com")
                                     (smtpmail-smtp-server . "smtp-mail.outlook.com")
                                     (smtpmail-smtp-service . 587)
                                     (smtpmail-stream-type . starttls)
                                     (smtpmail-smtp-user . "abhinav.tushar.vs@hotmail.com")
                                     (mu4e-sent-messages-behavior . sent)
                                     (mu4e-sent-folder . "/Outlook/Sent")
                                     (mu4e-drafts-folder . "/Outlook/Drafts")
                                     (mu4e-trash-folder . "/Outlook/Trash")
                                     (mu4e-refile-folder . "/Outlook/Archive")))))

  (with-eval-after-load 'org
    (setq org-startup-indented t
          org-clock-idle-time 5
          org-bullets-bullet-list '("#")
          org-ellipsis "  "
          org-pretty-entities t
          org-hide-emphasis-markers t
          org-agenda-block-separator ""
          org-fontify-whole-heading-line t
          org-fontify-done-headline t
          org-fontify-quote-and-verse-blocks t)

    (customize-set-variable 'org-modules
                            '(org-bibtex
                              org-docview
                              org-habit
                              org-info
                              org-w3m))
    ;; Capture templates
    (setq org-directory user-journal-dir
          org-capture-templates
          '(("g" "Google calender event" entry (file user-gcal-file)
             "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
            ("y" "Yak" entry (file (concat user-journal-dir "yak.org"))
             "* %?")
            ("e" "Explore" entry (file (concat user-journal-dir "explore.org"))
             "* %? %^g")
            ("t" "Todo" entry (file (concat user-journal-dir "notes.org"))
             "* TODO %?\nSCHEDULED: %^T\n")
            ("b" "Bookmark" entry (file (concat user-journal-dir "notes.org"))
             "* TODO %?\n%a")
            ("d" "Deadline" entry (file (concat user-journal-dir "notes.org"))
             "* %?\nDEADLINE: %^T")))

    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

    (setq org-agenda-custom-commands
          '(("n" "Main agenda view"
             ((tags "micro"
                    ((org-agenda-overriding-header "Micro tasks")))
              (todo "TODO")
              (agenda "")))
            ("r" "Readings"
             ((todo "READING"
                    ((org-agenda-files (list user-bookmarks-file))
                     (org-agenda-overriding-header "Bookmarks")))
              (todo "READING"
                    ((org-agenda-files (list user-books-file))
                     (org-agenda-overriding-header "Books")))
              (todo "NEXT"
                    ((org-agenda-files (list user-books-file))
                     (org-agenda-overriding-header "Upcoming books")))))
            ("d" "Upcoming deadlines" agenda ""
             ((org-agenda-entry-types '(:deadline))
              (org-deadline-warning-days 30)
              (org-agenda-time-grid nil)
              (org-agenda-overriding-header "Upcoming deadlines")))))))

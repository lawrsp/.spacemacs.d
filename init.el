;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     better-defaults
     osx
     (spacemacs-purpose)
     (unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
     ;; themes-megapack
     theming
     ;; (neotree :variables
     ;;          neo-theme 'classic
     ;;          neo-smart-open  t
     ;;          neo-vc-integration '(char face)
     ;;          neo-default-system-application "mywslopen"
     ;;          )
     ;; (spacemacs-modeline :variables
     ;;                     doom-modeline-buffer-file-name-style 'relative-from-project)
     (treemacs :variables
               treemacs-collapse-dirs 3
               treemacs-use-filewatch-mode t
               treemacs-use-follow-mode t
               treemacs-use-all-the-icons-theme t
               treemacs-use-git-mode 'simple)
     ;; window-stash
     (multiple-cursors :variables
                       multiple-cursors-backend 'evil-mc)
     ;; (chinese :variables
     ;;          pyim-default-scheme 'rime
     ;;          pyim-page-tooltip 'posframe
     ;;          rime-share-data-dir  "~/config/rime/share"
     ;;          rime-user-data-dir  "~/config/rime/user"
     ;;          )
     (rime :variables
           rime-librime-root "~/.nix-profile"
           rime-emacs-module-header-root "~/.nix-profile/include"
           rime-share-data-dir (concat (getenv "XDG_CONFIG_HOME") "/rime/share")
           rime-user-data-dir (concat (getenv "XDG_CONFIG_HOME") "/rime/user")
           rime-show-candidate 'posframe
           ;; popup
           ;; rime-cursor "˰"
           )
     (sis)
     (llm)
     ;; spell-checking
     syntax-checking
     (evil-pinyin)
     version-control
     git
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/")
     ;; helm
     ivy
     ;; (ivy :variables
     ;;      ivy-initial-inputs-alist nil)
     (org :variables
          spaceline-org-clock-p t
          org-enable-valign t
          org-enable-verb-support t
          org-edit-src-content-indentation 0
          org-projectile-file "~/org/gtd/gtd.org"
          org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WATCH(a)"  "BUG(b)" "|" "DONE(d)" "CANCELLED(c)"))
          ;; org-agenda-window-setup 'other-window
          org-agenda-files '("~/org/gtd/gtd.org"
                             "~/org/gtd/inbox.org"
                             "~/org/gtd/tickler.org")
          org-capture-templates '(("t" "Todo [inbox]" entry
                                   (file+headline "~/org/gtd/inbox.org" "Tasks")
                                   "* TODO %i%?")
                                  ("T" "Tickler" entry
                                   (file+headline "~/org/gtd/tickler.org" "Tickler")
                                   "* %i%? \n %U")
                                  ("l" "Link" entry
                                   (file+headline "~/org/gtd/inbox.org" "Link")
                                   "* %:annotation\n%i\n" :immediate-finish t :kill-buffer t)
                                  ("j" "Journal entry" entry (function org-journal-find-location)
                                   "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
                                  )
          org-refile-targets '(("~/org/gtd/inbox.org" :maxlevel . 1)
                               ("~/org/gtd/gtd.org" :maxlevel . 3)
                               ("~/org/gtd/someday.org" :level . 1)
                               ("~/org/gtd/tickler.org" :maxlevel . 2))

          ;; for org-brain
          ;; org-brain-path "~/org/notes"
          ;; for org-journal
          org-enable-org-journal-support t
          org-journal-dir "~/org/journal/"
          org-journal-file-type 'monthly
          org-journal-date-format "%A, %Y-%m-%d"
          org-journal-enable-agenda-integration nil
          org-journal-skip-carryover-drawers (list "LOGBOOK")
          org-icalendar-store-UID t
          org-icalendar-include-todo "all"
          org-icalendar-combined-agenda-file "~/org/journal/export-journal.ics"
          org-extend-today-until 4
          org-enable-github-support t
          ;; org-enable-bootstrap-support t
          org-enable-hugo-support t
          ;; org-enable-trello-support t
          org-enable-org-journal-support t
          org-enable-reveal-js-support t
          ;; promodoro
          org-pomodoro-length 25
          org-want-todo-bindings t
          org-enable-roam-support t
          org-enable-roam-ui t
          org-roam-directory "~/org/notes"
          org-roam-node-display-template (concat "${title} " (propertize "${tags:100}" 'face 'org-tag))
          org-roam-capture-templates '(("d" "default" plain "%?"
                                        :target (file+head "${slug}.org"
                                                           "#+title: ${title}\n#+created_at: %<%Y-%m-%d %H:%M:%S>")
                                        :unnarrowed t))
          org-download-screenshot-method "powershell.exe -Command \"(Get-Clipboard -Format image).Save('$(wslpath -w %s)')\""
          org-download-heading-lvl nil
          org-download-image-dir "./pics")
     emacs-lisp
     windows-scripts
     nginx
     sql
     prettier
     (html :variables
           web-fmt-tool 'prettier)
     yaml
     csharp
     (c-c++ :variables
            c-c++-backend 'lsp-clangd)
     (shell :variables
            shell-default-height 25
            shell-default-position 'bottom)
     (lsp :variables
          lsp-ui-doc-show-with-cursor t
          ;; lsp-ui-doc-enable	nil
          ;; lsp-ui-doc-delay 0.8
          ;; lsp-ui-flycheck-enable nil
          ;; lsp-ui-peek-enable t
          ;; lsp-ui-sideline-delay 0.8
          ;; lsp-ui-sideline-update-mode 'line
          ;; lsp-ui-sideline-enable nil
          )
     (tide :variables
           tide-completion-ignore-case t)
     (json :variables
           json-fmt-tool 'prettier
           json-backend 'company-json
           json-fmt-on-save t)
     ;;import-js
     (node :variables
           node-add-modules-path t)
     (javascript :variables
                 js2-mode-show-strict-warnings nil
                 js2-strict-missing-semi-warning nil
                 javascript-backend 'tide
                 ;; javascript-lsp-linter nil
                 ;; javascript-import-tool 'import-js
                 javascript-fmt-on-save t
                 javascript-fmt-tool 'prettier)
     (typescript :variables
                 typescript-fmt-tool 'prettier
                 typescript-backend 'tide
                 ;; typescript-backend 'lsp
                 ;; tide-tsserver-executable "~/.npm-packages/bin/tsserver"
                 typescript-linter 'eslint
                 ;; typescript-lsp-linter nil
                 typescript-fmt-on-save t)
     react
     (vue :variables vue-backend 'dumb)
     ;; (vue :variables
     ;;      vue-format-before-save t)
     (go :variables
         ;; go-backend 'go-mode
         go-backend 'lsp
         go-tab-width 2
         go-format-before-save t
         gofmt-command "goimports"
         ;;flycheck-go-build-install-deps t
         ;;godoc-at-point-function 'godoc-gogetdoc
         ;; go-install-after-save 'sync
         go-use-golangci-lint t
         )
     (rust :variables rust-backend 'lsp)
     docker
     (python :variables
             python-backend 'lsp
             python-format-on-save t
             python-lsp-server 'pyright)
     (markdown :variables
               markdown-mmm-auto-modes '(
                                         "go"
                                         ("javascript" "rjsx")
                                         ("html" "web")
                                         ("elisp" "emacs-lisp"))
               markdown-live-preview-engine 'vmd)
     ;; (mind-wave :variables
     ;;            mind-wave-api-key-path  (concat (getenv "XDG_CONFIG_HOME") "/chatgpt/api_key.txt"))
     ;; (aichat :variables
     ;;         aichat-bingai-cookies-file (concat (getenv "XDG_CONFIG_HOME") "/bing/cookies.json")
     ;;         aichat-bingai-chat-file "~/.aichat/bing/chat.md"
     ;;         aichat-openai-chat-directory "~/.aichat/openai")
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(sqlite3)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024 8)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         solarized-light
                         spacemacs-light
                         solarized-dark)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.2)
   ;; dotspacemacs-mode-line-theme '(doom :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :visual nil
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         neotree-mode
                                         :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
  This function is called immediately after `dotspacemacs/init', before layer
  configuration.
  It is mostly for variables that should be set before packages are loaded.
  If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;;(setq configuration-layer-elpa-archives
  ;;     (("melpa-stable" . "stable.melpa.org/packages/")
  ;; ("melpa" . "melpa.org/packages/")
  ;;     ("gnu" . "elpa.gnu.org/packages/")
  ;;    ("nongnu" . "elpa.nongnu.org/nongnu/"))
  ;;       '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ;;         ("org-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
  ;;         ("gnu-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
  ;; '(("melpa-cn" . "https://mirrors.163.com/elpa/melpa/")
  ;;   ("org-cn"   . "https://mirrors.163.com/elpa/org/")
  ;;   ("gnu-cn"   . "https://mirrors.163.com/elpa/gnu/"))
  ;; '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;   ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;   ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/"))
  ;; )
  ;;  )
  (setq theming-modifications
        '((zenburn
           ;; zenburn set:
           (vertical-border :foreground "grey33")
           (company-tooltip-selection :foreground "#DCDCCC" :background "#6F6F6F"))
          ;; (solarized-light
          ;;  ;; C7EDCC
          ;;  ;; solarized-light set
          ;;  (default :background "#CCE8CF"))
          ;; (spacemacs-light
          ;;  ;; spacemacs-light set
          ;;  (default :background "#CCE8CF"))
          ))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; (use-package doom-themes
  ;;   :config
  ;;   ;; Global settings (defaults)
  ;;   ;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
  ;;   ;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;;   ;; (load-theme 'doom-one t)
  ;;   ;; Enable flashing mode-line on errors
  ;;   ;; (doom-themes-visual-bell-config)
  ;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;;   ;; (doom-themes-neotree-config)

  ;;   ;; not affected by variable-pitch
  ;;   (setq doom-themes-treemacs-enable-variable-pitch nil)
  ;;   ;; or for treemacs users
  ;;   ;; (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  ;;   (setq doom-themes-treemacs-theme "doom-atom")
  ;;   (doom-themes-treemacs-config)

  ;;   ;; Corrects (and improves) org-mode's native fontification.
  ;;   ;; (doom-themes-org-config)
  ;;   )


  (with-eval-after-load 'undo-tree
    (setq undo-tree-auto-save-history nil))

  ;; ;; patch neotree-show
  ;; (with-eval-after-load 'neotree
  ;;   (defun neotree-show ()
  ;;     "Show the NeoTree window."
  ;;     (interactive)
  ;;     (let ((cw (selected-window))
  ;;           (path (buffer-file-name)))  ;; save current window and buffer
  ;;       (if neo-smart-open
  ;;           (progn
  ;;             (when (and (fboundp 'projectile-project-p)
  ;;                        (projectile-project-p)
  ;;                        (fboundp 'projectile-project-root)
  ;;                        (setq path (file-truename path)))
  ;;               (neotree-dir (projectile-project-root)))
  ;;             (neotree-find path))
  ;;         (neo-global--open))
  ;;       (neo-global--select-window)
  ;;       (when neo-toggle-window-keep-p
  ;;         (select-window cw)))))

  ;; (with-eval-after-load 'treemacs-mode
  ;;   (defun mytreemacs--create-file-react-hook (path)
  ;;     (find-file path)
  ;;     (insert "import React from 'react';\n")
  ;;     (rjsx-mode))

  ;;   (defun mytreemacs--create-file-go-hook (path)
  ;;     (find-file path)
  ;;     (let* ((name (file-name-directory path))
  ;;            (pkgname (car (last (split-string name "/" t))))
  ;;            (head (format "package %s\n" pkgname)))
  ;;       (insert head)))

  ;;   (defun mytreemacs-create-file-react ()
  ;;     (interactive)
  ;;     (let ((treemacs-create-file-functions 'mytreemacs--create-file-react-hook))
  ;;       (treemacs-create-file)))

  ;;   (defun mytreemacs-create-file-go ()
  ;;     (interactive)
  ;;     (let ((treemacs-create-file-functions 'mytreemacs--create-file-go-hook))
  ;;       (treemacs-create-file)))

  ;;   (define-key treemacs-mode-map (kbd "cr") #'mytreemacs-create-file-react)
  ;;   (define-key treemacs-mode-map (kbd "cg") #'mytreemacs-create-file-go))

  ;; imput mothed
  ;; (with-eval-after-load "liberime"
  ;;   (liberime-try-select-schema "luna_pinyin_simp")
  ;;   (setq pyim-default-scheme 'rime-quanpin))

  (setq tab-always-indent t)
  (setq auto-revert-check-vc-info t)

  ;; set cjk font face under graphic UI
  ;; (when (display-graphic-p)
  ;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;     (set-fontset-font (frame-parameter nil 'font)
  ;;                       charset
  ;;                       (font-spec :family "Noto Sans Mono CJK SC"))))

  ;; Notice: use valign instead
  ;; setup variable-pitch face
  ;; (custom-set-faces
  ;;  '(variable-pitch ((t . (:family "Source Code Pro"))))
  ;;  '(fixed-pitch ((t . (:family "Noto Sans Mono CJK SC")))))

  ;; use variable-pitch-mode in org-mode
  (with-eval-after-load 'org
    ;; (setq line-spacing 0)
    ;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-hide nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-link nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-date nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-todo nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-done nil :inherit 'fixed-pitch)
    ;; (add-hook 'org-mode-hook 'variable-pitch-mode)
    (add-to-list 'org-src-lang-modes (cons "godot" 'python))
    (add-to-list 'org-src-lang-modes (cons "jsx" 'rjsx))
    )

  ;; (with-eval-after-load 'markdown-mode
  ;;   (add-hook 'markdown-mode-hook 'set-buffer-variable-pitch) )
  ;; (with-eval-after-load 'info-mode
  ;;   (add-hook 'Info-mode-hook 'set-buffer-variable-pitch))

  (setq css-indent-offset 2)
  (setq js-indent-level 2)

  (add-to-list 'auto-mode-alist '("\\.air\\'" . python-mode))

  (add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.prettierrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.stylelintrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.dbj\\'" . js2-mode))

  ;; (with-eval-after-load 'company
  ;;   (define-key company-active-map (kbd "C-n") #'company-select-next)
  ;;   (define-key company-active-map (kbd "C-p") #'company-select-previous)
  ;;   )

  ;; (defun wsl-browse-url-xdg-open (url &optional ignored)
  ;;   (interactive (browse-url-interactive-arg "URL: "))
  ;;   (shell-command-to-string (concat "explorer.exe " url)))
  ;; (advice-add #'browse-url-xdg-open :override #'wsl-browse-url-xdg-open)

  (defun --system-is-wsl ()
    (if (and (spacemacs/system-is-linux)
             (string-match
              "Linux.*Microsoft.*Linux"
              (shell-command-to-string "uname -a"))
             )
        t
      nil))

  (when (--system-is-wsl)
    (setq
     browse-url-generic-program  "/mnt/c/Windows/System32/cmd.exe"
     browse-url-generic-args     '("/c" "start")
     browse-url-browser-function #'browse-url-generic))

  ;; (let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe")
  ;;       (cmd-args '("/c" "start")))
  ;;   (when (file-exists-p cmd-exe)
  ;;     (setq browse-url-generic-program  cmd-exe
  ;;           browse-url-generic-args     cmd-args
  ;;           browse-url-browser-function 'browse-url-generic)))

  (with-eval-after-load 'yasnippet
    (setq hippie-expand-try-functions-list
          (remove 'yas-hippie-try-expand hippie-expand-try-functions-list))
    (define-key yas-minor-mode-map (kbd "M-/") 'yas-expand))

  ;; set save on mac
  (when (spacemacs/system-is-mac)
    (define-key global-map  (kbd-mac-command "s") 'save-buffer))

  ;; (defvar terminal-notifier-command (executable-find "terminal-notifier") "The path to terminal-notifier.")
  ;; (defun terminal-notifier-notify (title message)
  ;;   "Show a message with `terminal-notifier-command`."
  ;;   (start-process "terminal-notifier"
  ;;                  "*terminal-notifier*"
  ;;                  terminal-notifier-command
  ;;                  "-group" "Emacs"
  ;;                  "-sender" "org.gnu.Emacs"
  ;;                  "-title" title
  ;;                  "-message" message
  ;;                  "-activate" "org.gnu.Emacs")
  ;;   )
  ;; (defun timed-notification(time msg)
  ;;   (interactive "sNotification when (e.g: 2 minutes, 60 seconds, 3 days): \nsMessage: ")
  ;;   (run-at-time time nil (lambda (msg) (terminal-notifier-notify "Emacs" msg)) msg))

  ;; journal
  (with-eval-after-load 'org-journal
    (defun org-journal-find-location ()
      ;; Open today's journal, but specify a non-nil prefix argument in order to
      ;; inhibit inserting the heading; org-capture will insert the heading.
      (org-journal-new-entry t)
      ;; Position point on the journal's top-level heading so that org-capture
      ;; will add the new entry as a child entry.
      (goto-char (point-min))))

  ;; timer
  (with-eval-after-load 'org-pomodoro
    (defun mytimer-notifier-notify (msg)
      (org-pomodoro-maybe-play-sound :pomodoro))
    (setq org-show-notification-handler
          (lambda (msg) (mytimer-notifier-notify msg)))
    (if-let (player (executable-find "paplay"))
        (setq org-pomodoro-audio-player player))
    )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     '(gnu-elpa-keyring-update ace-link add-node-modules-path aggressive-indent aichat async-await iter2 promise auto-compile auto-highlight-symbol auto-yasnippet blacken bmx-mode browse-at-remote centered-cursor-mode clean-aindent-mode code-cells column-enforce-mode company-anaconda anaconda-mode company-c-headers company-go company-rtags company-statistics company-web web-completion-data company-ycmd company counsel-css counsel-projectile counsel cpp-auto-include cython-mode define-word devdocs diff-hl dired-quick-sort disaster tablist aio docker-tramp dockerfile-mode drag-stuff dumb-jump editorconfig elisp-def elisp-slime-nav emmet-mode emr clang-format esh-help eshell-prompt-extras eshell-z eval-sexp-fu evil-anzu anzu evil-args evil-cleverparens paredit evil-collection annalist evil-easymotion evil-escape evil-exchange evil-goggles evil-iedit-state iedit evil-indent-plus evil-lion evil-lisp-state evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-org evil-pinyin names evil-surround evil-textobj-line evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar expand-region eyebrowse fancy-battery flx-ido flx flycheck-elsa flycheck-golangci-lint flycheck-package package-lint flycheck-pos-tip pos-tip flycheck-rtags flycheck-ycmd gendoxy gh-md git-link git-messenger git-modes gitignore-templates gnuplot go-eldoc go-fill-struct go-gen-test go-guru go-impl go-rename go-tag go-mode godoctor golden-ratio google-c-style google-translate helm-make hide-comnt highlight-indentation highlight-numbers parent-mode highlight-parentheses hl-todo hungry-delete impatient-mode importmagic epc ctable concurrent indent-guide info+ inspector ivy-avy ivy-hydra ivy-purpose ivy-rtags ivy-xref ivy-yasnippet js-doc js2-refactor multiple-cursors json-mode json-navigator hierarchy json-reformat json-snatcher launchctl link-hint live-py-mode livid-mode lorem-ipsum origami lsp-mode macrostep markdown-toc multi-line shut-up multi-term multi-vterm mwim nameless nginx-mode nodejs-repl nose npm-mode omnisharp csharp-mode auto-complete open-junk-file org-cliplink org-download org-journal org-mime org-pomodoro alert log4e gntp org-present org-projectile org-project-capture org-category-capture org-re-reveal htmlize org-rich-yank magit-section emacsql ox-hugo paradox rustic transient zenburn-theme ycmd yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum window-purpose which-key wgrep websocket web-mode web-beautify vterm volatile-highlights vmd-mode vim-powerline vi-tilde-fringe verb uuidgen use-package unicode-fonts unfill typescript-mode treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs-all-the-icons toml-mode toc-org tide terminal-here term-cursor tagedit symon symbol-overlay swiper string-inflection string-edit-at-point sqlite3 sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc solarized-theme smex smeargle smartparens slim-mode skewer-mode sis shell-pop scss-mode sass-mode rust-mode rtags ron-mode rjsx-mode rime reveal-in-osx-finder restart-emacs rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode prettier-js powershell popwin pippel pipenv pip-requirements pcre2el password-generator ox-gfm overseer osx-trash osx-clipboard org-superstar markdown-mode hybrid-mode holy-mode evil-evilified-state dotenv-mode diminish bind-map async))
   '(warning-suppress-types '((comp))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(company-tooltip-selection ((t (:foreground "#DCDCCC" :background "#6F6F6F"))))
   '(vertical-border ((t (:foreground "grey33")))))
  )

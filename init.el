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
   '(octave
     csv
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------


     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)

     ;; ---------- Clojure ---------------------

     (clojure :variables
              cider-repl-display-help-banner nil      ;; disable help banner
              cider-pprint-fn 'fipp                   ;; fast pretty printing
              clojure-indent-style 'align-arguments
              clojure-align-forms-automatically t
	      cider-result-overlay-position 'at-eol
              cider-overlays-use-font-lock t
              clojure-enable-fancify-symbols t
              clojure-enable-clj-refactor t
              clojure-toplevel-inside-comment-form t
              cider-repl-buffer-size-limit 1000
              ;; Need very recent version of spacemacs to enable as a linter
              ;; otherwise see https://github.com/borkdude/clj-kondo/blob/master/doc/editor-integration.md#spacemacs

              ;; 
              ;; TODO requires installing clj Kondo

	      ;; This is now part of clojure-lsp
	      ;; https://practicalli.github.io/spacemacs/install-spacemacs/clojure-lsp/configure-lsp-and-cider.html
              ;; clojure-enable-linters 'clj-kondo
	      )

    ;;All the possible variables that can be set on the lsp layer (that have been found so far)

       (lsp :variables
            ;; Commented variables are default values in the lsp layer configuration

            ;; Formatting and indentation
            lsp-enable-on-type-formatting nil
            ;; Set to nil to use CIDER features instead of LSP UI
            lsp-enable-indentation nil
            ;; lsp-enable-completion-at-point nil

            ;; Buffer visual elements
            ;; shows directory path at top of buffer
            ;; lsp-headerline-breadcrumb-enable nil

            ;; symbol highlighting - `lsp-toggle-symbol-highlight` toggles highlighting
            ;; change made to doom-gruvbox-light theme for subtle highlighting
            lsp-enable-symbol-highlighting t

            ;; Show lint errors in the mode-bar (tested on doom-modeline)
            ;; remove local clj-kondo binary from path  used by emacs or otherwise remove clj-kondo as clojure layer lint tool
            ;; flycheck-clj-kondo shows all the projects open with issues.  Without that enabled in the clojure layer, only
            ;; lint issues from the current project are shown.  It could be because I had both lsp and clojure layer clj-kondo
            lsp-modeline--enable-diagnostics t

            ;; popup documentation boxes
            lsp-ui-doc-enable nil          ;; disable doc popups
            lsp-ui-doc-show-with-cursor nil
            lsp-ui-doc-show-with-mouse t
            lsp-ui-doc-delay 2

            ;; show code actions and diagnostics text as right-hand side of buffer
            lsp-ui-sideline-enable nil
            ;; Is this just display or disabling the actions
            ;; lsp-modeline-code-actions-enable nil
            ;; lsp-ui-sideline-show-diagnostics nil
            ;; When non-nil, the symbol information overlay includes symbol name (redundant for c-modes).
            ;; lsp-ui-sideline-show-symbol    nil

            ;; show reference count for functions (assume their maybe other lenses in future)
            lsp-lens-enable t

            ;; Symbol highlighting
            ;; lsp-enable-symbol-highlighting nil
            ;; Do not highlight current symbol, only other matches ??  Avoids visual clashing with visual select
            lsp-symbol-highlighting-skip-current nil

            ;; add a delay to all lsp features, how much does this affect ?
            ;; lsp-idle-delay 2

                      ;; Efficient use of space in treemacs-lsp display
            treemacs-space-between-root-nodes nil
            ;;
            ;; lsp-file-watch-threshold 10000
            )

     
     ;;add the joker linter for real time linting in clojure
     ;; requires the local install of joker tools
     ;;superseded and incompatible with kondo.
     ;;clojure-lint

     ;; -------- Front end work -----------------
     ;;

     ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/javascript
     ;; Will need to follow install instructions.
     ;; e.g npm install -g tern && npm install -g js-beutify && npm install -g eslint

     ;; I believe this also requires you install tern. 
     javascript

     ;; react: http://develop.spacemacs.org/layers/+frameworks/react/README.html
     ;; will need to follow install instructions.
     react

     html


     ;; --------- Version control ---------------
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)

     (git :variables
          magit-diff-refine-hunk 'all
          git-magit-status-fullscreen t
          git-enable-github-support t
          git-gutter-use-fringe t)

     github


     ;; ----------- Other ------------------------
     python
     sql
     yaml
     asciidoc
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     better-defaults
     emacs-lisp
     markdown
     (org :variables
          org-enable-github-support t

          ;; In order to be able to use org-reveal, download reveal.js from its homepage and set org-reveal-js to the download path, as described in the manual. Alternatively, add the following line to each .org file you want to process:
          ;; #+REVEAL_ROOT: http://cdn.jsdelivr.net/reveal.js/3.0.0/
          ;;org-enable-reveal-js-support t
          )
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     kubernetes

     spell-checking
     syntax-checking
     haskell
     ;; shows commands as you type in a seperate buffer
     command-log
     ;; everyone loves emojis
     emoji
     ;;cat tells you where you are in your file
     (colors :variables
             colors-enable-nyan-cat-progress-bar t))

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ubuntu-theme

                                      (use-package clojure-essential-ref
                                        ;; ...
                                        :bind (
                                               :map cider-mode-map
                                               ("C-h F" . clojure-essential-ref)
                                               :map cider-repl-mode-map
                                               ("C-h F" . clojure-essential-ref)))

                                      ;; -------------- Kubernetes ---------------
                                      ;; (use-package kubernetes
                                      ;;   :ensure t
                                      ;;   :commands (kubernetes-overview))

                                      ;; ;; If you want to pull in the Evil compatibility package.
                                      ;; (use-package kubernetes-evil
                                      ;;   :ensure t
                                      ;;   :after kubernetes)

                                      ;; Colorize color names in buffers
                                      (use-package rainbow-mode
                                        :quelpa (rainbow-mode :fetcher github :repo "emacsmirror/rainbow-mode")
                                        :diminish
                                        :hook (css-mode html-mode js-mode emacs-lisp-mode text-mode))

                                     

                                    (use-package evil-better-visual-line
                                            :ensure t
                                            :config
                                            (evil-better-visual-line-on))
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
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
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
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
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

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
   dotspacemacs-read-process-output-max (* 1024 1024)



   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
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

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4



   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

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
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Use a Font that ubuntu has.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 18
                               :weight normal
                               :width normal)


   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)



   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
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
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 5

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
   dotspacemacs-helm-no-header nil
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
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

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
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
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
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',u
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   dotspacemacs-smartparens-closing-parenthesis t

   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t


  ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil



   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."


  ;; make stacktraces show minimal amount as the default, we can expand from there
  (setq cider-stacktrace-default-filters '(project))

  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)

  ;;
  ;; Magit - forge configuration
  ;;
  ;; Set the files that are searched for writing tokens
  ;; by default ~/.authinfo will be used
  ;; and write a token in unencrypted format
  (setq auth-sources '("~/.authinfo.gpg"))
  ;;
  ;; End of Magit - forge configuration
  ;;

  (setq history-delete-duplicates t)
  (setq history-length 10)


  ;; --------------- Clojure -----------------

  ;; This makes it impossible to cut, copy, yank such that it breaks the structure.
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)

  ;; This makes sure forms are aligned e.g {:hello "there"
  ;;                                       :my    "friend"}
  
  ;; cant do this because apprently intlliji doesnt support that
  ;; off for work
  ;;(setq clojure-indent-style 'align-arguments)

  ;; not sure what always indent means...
  ;;(setq clojure-indent-style 'always-indent)

  ;; This indents on block changes (possible causing to much formatting!)
  ;; off for work
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

  ;;(setq clojure-align-forms-automatically t)


  ;;---------------- prevent pressing d from acting like dd ----------------
  ;; re https://emacs.stackexchange.com/questions/35946/strange-behaviour-on-evil-delete
  (defun stop-using-minibuffer ()
    "kill the minibuffer"
    (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
      (abort-recursive-edit)))

  (add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

  ;;; ---------- datomic start
  ;; re https://raw.githubusercontent.com/dakra/datomic.el/master/datomic.el




;;; datomic.el --- Utility functions for working with Datomic projects  -*- lexical-binding: t -*-

;; Copyright (c) 2019-2020 Daniel Kraus <daniel@kraus.my>

;; Author: Daniel Kraus <daniel@kraus.my>
;; URL: https://github.com/dakra/datomic.el
;; Keywords: clojure, datomic, ions, convenience, tools, processes
;; Version: 0.1
;; Package-Requires: ((emacs "25.2") (async "1.9") (parseedn "0.1") (projectile "2.0"))

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; `datomic.el' provides utilities for working with the Datomic.

;;; Code:

(require 'async)
(require 'compile)
(require 'parseedn)
(require 'projectile)


;;; Customization

(defgroup datomic nil
  "Datomic utilities"
  :prefix "datomic-"
  :group 'tools)

(defcustom datomic-ion-auto-deploy t
  "Whether or not to automatically deploy after a Ion push."
  :type 'boolean)

(defcustom datomic-ion-auto-check-status t
  "Whether or not to automatically poll the status after a Ion deploy."
  :type 'boolean)

(defcustom datomic-access-program "datomic-access"
  "Path to the datomic-access bash script."
  :type 'file)

(defcustom datomic-analytics-program "datomic-analytics"
  "Path to the datomic-analytics bash script."
  :type 'file)

(defcustom datomic-gateway-program "datomic-gateway"
  "Path to the datomic-gateway bash script."
  :type 'file)

(defcustom datomic-systems nil
  "List of datomic system names."
  :type '(repeat string)
  :safe (lambda (value)
          (and (listp value)
               (cl-every 'stringp value))))


;;; Variables

(defvar datomic-ion-deploy-group)
(defvar datomic-ion-last-execution-arn)
(defvar datomic-ion-last-rev)


;;; Functions

(defun datomic--read-system ()
  "Read Datomic system name from user."
  (if (and (car datomic-systems) (not (cdr datomic-systems)))
      (car datomic-systems)
    (if (not (car datomic-systems))
        (read-string "System name: ")
      (completing-read "System name: " datomic-systems))))

;; FIXME: -p aws-profile and -r aws-region --port port
;;;###autoload
(defun datomic-access-client (system)
  "Start the datomic-access client tunnel to SYSTEM."
  (interactive (list (datomic--read-system)))
  (let ((cmd (concat datomic-access-program " client " system))
        (name-fn (lambda (_mode) (concat "*" (file-name-base datomic-access-program) " client " system "*"))))
    (compilation-start cmd nil name-fn)))


;;;###autoload
(defun datomic-ion-push ()
  "Push the current project Datomic Ion."
  (interactive)
  (let* ((default-directory (projectile-project-root))
         (name "ion push")
         (program "clojure")
         (args '("-A:dev" "-m" "datomic.ion.dev" "{:op :push}"))
         (finish-func (lambda (proc)
                        (save-excursion
                          (with-current-buffer
                              (process-buffer proc))
                          (goto-char (point-min))
                          (kill-line 3)
                          (let* ((edn (car (parseedn-read)))
                                 (group (car (gethash ':deploy-groups edn)))
                                 (rev (gethash ':rev edn)))
                            (setq datomic-ion-deploy-group group)
                            (setq datomic-ion-last-rev rev)
                            (when (or datomic-ion-auto-deploy
                                      (yes-or-no-p
                                       (format "Deploy %s revision '%s' t group %s? "
                                               (projectile-project-name) rev group)))
                              (datomic-ion-deploy group rev)))))))
    (apply #'async-start-process name program finish-func args)))


(defun datomic-ion-deploy (&optional group rev)
  "Deploy the last pushed Datomic Ion of the current project.
Optional use system GROUP and revision REV for deployment."
  (interactive)
  (when (or (and group rev)
            (yes-or-no-p
             (format "Deploy %s revision '%s' to group %s? "
                     (projectile-project-name) datomic-ion-last-rev datomic-ion-deploy-group)))
    (let* ((default-directory (projectile-project-root))
           (name "ion deploy")
           (program "clojure")
           (args `("-A:dev" "-m" "datomic.ion.dev"
                   ,(format "{:op :deploy, :group %s, :rev \"%s\"}"
                            datomic-ion-deploy-group datomic-ion-last-rev)))
           (finish-func (lambda (proc)
                          (save-excursion
                            (with-current-buffer
                                (process-buffer proc))
                            (goto-char (point-min))
                            (let* ((edn (car (parseedn-read)))
                                   (arn (gethash ':execution-arn edn)))
                              (setq datomic-ion-last-execution-arn arn)
                              (when datomic-ion-auto-check-status
                                (datomic-ion-status arn)))))))
      (apply #'async-start-process name program finish-func args))))

(defun datomic-ion-status (&optional arn)
  "Get the status of the last Datomic Ion deploy.
Optinally specify execution ARN."
  (interactive)
  (let* ((default-directory (projectile-project-root))
         (name "ion deploy")
         (program "clojure")
         (args `("-A:dev" "-m" "datomic.ion.dev"
                 ,(format "{:op :deploy-status, :execution-arn %s}"
                          (or arn datomic-ion-last-execution-arn))))
         (finish-func (lambda (proc)
                        (save-excursion
                          (with-current-buffer
                              (process-buffer proc))
                          (goto-char (point-min))
                          (let* ((edn (car (parseedn-read)))
                                 (status (gethash ':deploy-status edn))
                                 (code-status (gethash ':code-deploy-status edn)))
                            (if (and (or (string= status "RUNNING") (string= code-status "RUNNING"))
                                     (or datomic-ion-auto-check-status
                                         (yes-or-no-p "Deploy still running. Check status again? ")))
                                (datomic-ion-status)
                              (message "Deploy status: %s - Code Deploy status: %s"
                                       status code-status)))))))
    (apply #'async-start-process name program finish-func args)))

;; (provide 'datomic)
;;; datomic.el ends hereo




  ;;; ---------- datomic end

)

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
 '(cider-shadow-cljs-global-options "")
 '(cider-shadow-default-options ":app")
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files '("~/Personal/test.org"))
 '(package-selected-packages
   '(evil-better-visual-line helm-gtags ggtags counsel-gtags counsel swiper ivy clojure-essential-ref ox-gfm insert-shebang fish-mode company-shell orgit magit-gitflow magit-popup magit-gh-pulls github-search github-clone git-timemachine git-gutter-fringe+ git-gutter+ evil-magit magit git-commit with-editor yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill ubuntu-theme toc-org tagedit sql-indent spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc markdown-mode macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc intero indent-guide hy-mode dash-functional hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio gnuplot gitignore-mode github-browse-file gitconfig-mode gitattributes-mode git-messenger git-link git-gutter-fringe fringe-helper git-gutter gist gh marshal logito pcache ht gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-haskell flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit transient evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emoji-cheat-sheet-plus emmet-mode elisp-slime-nav dumb-jump diminish diff-hl define-word cython-mode company-web web-completion-data company-statistics company-quickhelp pos-tip company-ghci company-ghc ghc haskell-mode company-emoji company-cabal company-anaconda company command-log-mode column-enforce-mode color-identifiers-mode coffee-mode cmm-mode clojure-snippets clj-refactor hydra inflections multiple-cursors paredit lv clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu cider sesman spinner queue pkg-info parseedn clojure-mode parseclj a epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed anaconda-mode pythonic f dash s aggressive-indent adoc-mode markup-faces adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))
 '(paradox-github-token t)
 '(safe-local-variable-values
   '((cider-clojure-cli-aliases . "A:ion-dev")
     (cider-clojure-cli-alases . "A:ion-dev")
     (cider-shadow-watched-builds "app")
     (cider-clojure-cli-aliases . "-A:shadow:deploy")
     (cider-preferred-build-tool . shadow-cljs)
     (cider-shadow-default-options . "app")
     (cider-preferred-build-tool . clojure-cli)
     (cider-clojure-cli-global-options . "-A:dev:cljs")
     (eval define-clojure-indent
           (assoc 0)
           (ex-info 0))
     (eval progn
           (make-variable-buffer-local 'cider-jack-in-nrepl-middlewares)
           (add-to-list 'cider-jack-in-nrepl-middlewares "shadow.cljs.devtools.server.nrepl/middleware"))
     (cider-repl-display-help-banner)
     (eval cider-register-cljs-repl-type 'clojure-cli "watch app")
     (cider-lein-global-options . shadow)
     (cider-default-clj-repl . shadow-cljs)
     (cider-shadow-default-options . "frontend")
     (cider-shadow-default-options . "<your-build-name-here>")
     (cider-default-cljs-repl . shadow)
     (javascript-backend . tern)
     (javascript-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

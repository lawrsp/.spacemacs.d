(setq sis-packages
      '(
        sis
        ))

(defun sis/init-sis()
  (use-package sis
    :defer t
    :ensure t
    ;; :hook
    ;; enable the /follow context/ and /inline region/ mode for specific buffers
    ;; (((text-mode prog-mode) . sis-follow-context-mode)
    ;;  ((text-mode prog-mode) . sis-inline-mode))

    ;; For MacOS
    :config (sis-ism-lazyman-config
             ;; English input source may be: "ABC", "US" or another one.
             ;; "com.apple.keylayout.ABC"
             "com.apple.keylayout.US"
             ;; Other language input source: "rime", "sogou" or another one.
             ;; "im.rime.inputmethod.Squirrel.Rime"
             "com.apple.inputmethod.SCIM.ITABC")
    :init (progn
            ;; enable the /cursor color/ mode
            (sis-global-cursor-color-mode t)
            ;; enable the /respect/ mode
            (sis-global-respect-mode t)
            ;; enable the /follow context/ mode for all buffers
            (sis-global-follow-context-mode t)
            ;; enable the /inline english/ mode for all buffers
            (sis-global-inline-mode t)
            )))

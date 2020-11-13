(setq evil-pinyin-packages
      '(
        evil-pinyin
        ))

(defun evil-pinyin/init-evil-pinyin()
  (use-package evil-pinyin
    :init
    ;;(setq-default evil-pinyin-scheme 'simplified-xiaohe-all)
    ;;(setq-default evil-pinyin-with-search-rule 'always)

    :config
    ;;(evil-select-search-module 'evil-search-module 'evil-search)
    (global-evil-pinyin-mode)
    ))




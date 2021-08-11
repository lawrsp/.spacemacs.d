
(setq rime-packages
      '(
        rime
        posframe
        ))


;; useless: in magit status mode, donnot trigger the input rime predicates checks
;; (defun rime-predicate-magit-status-p ()
;;   (message "check magit status")
;;   (let ((result (or (derived-mode-p 'magit-status-mode)
;;                     (bound-and-true-p magit-transient-mode))))
;;     (message "hello %s" result)
;;     result)  
;;   )

(defun rime/init-rime ()
  (use-package rime
    ;; :init
    ;; (setq default-input-method "rime")
    :config
    ;; (setq rime-translate-keybindings
    ;;       '("C-f" "C-b" "C-n" "C-g" "C-p" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))
    ;; (setq rime-inline-ascii-trigger 'shift-l)
    (setq rime-disable-predicates
          '(
            ;; rime-predicate-evil-mode-p
            ;; 在英文字符串之后（必须为以字母开头的英文字符串）
            ;; rime-predicate-after-alphabet-char-p
            ;; 在 prog-mode 和 conf-mode 中除了注释和引号内字符串之外的区域
            ;; rime-predicate-prog-in-code-p
            ;; 在代码的字符串中，不含注释的字符串。
            ;; rime-predicate-in-code-string-p
            ;; 在行首要输入符号时
            ;; rime-predicate-punctuation-line-begin-p
            ;; 在任意英文字符且有空格之后
            ;; rime-predicate-space-after-ascii-p
            ;; 在中文字符且有空格之后
            rime-predicate-space-after-cc-p
            ;; 将要输入的为大写字母时
            ;; rime-predicate-current-uppercase-letter-p
            ))
    :bind (
           ;; :map rime-active-mode-map
           ;; 跳出候选框后，C-g要先escape
           ;; ("C-g" . 'rime--escape) 
           :map rime-mode-map
           ;; rime 的配置
           ("C-`" . 'rime-send-keybinding)
           )
    ))

(defun rime/post-init-posframe ()
  (when (eq rime-show-candidate 'posframe)
    (use-package posframe
      :defer t)
    ))


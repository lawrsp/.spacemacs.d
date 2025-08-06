(setq smart-path-packages
      '())

(defun smart-path/--system-is-wsl ()
  (if (and (spacemacs/system-is-linux)
           (string-match
            "Linux.*Microsoft.*Linux"
            (shell-command-to-string "uname -a"))
           )
      t
    nil))

(defun smart-path/current-in-windows-path ()
  "根据当前路径选择使用 Linux 的 which 或 Windows 的 which.exe。
如果当前路径在 /mnt 下，使用 Windows 的 which.exe，否则使用 Linux 的 which。"
  (if (smart-path/--system-is-wsl)
      (let ((current-dir (expand-file-name default-directory)))
        ;; 匹配 /mnt/c, /mnt/d 等
        (string-match "^/mnt/[a-z]" (downcase current-dir)))
    nil))

(defun smart-path/smart--find-project-bin (target &optional exec-target)
  (message (format "go to fined %s" target))
  (or
   ;; 1. 尝试在当前项目中查找（基于当前文件）
   (when-let* ((root (projectile-locate-dominating-file (buffer-file-name) (lambda (dir)
                                                                             (let ((result (expand-file-name target dir)))
                                                                               (message (format "check %s" result))
                                                                               (and (file-exists-p result)
                                                                                    (file-executable-p result)))))))
     (expand-file-name target root))
   ;; 2. 回退到全局路径
   (executable-find (or exec-target target))))


(defvar smart-path/executable-cache (make-hash-table :test 'equal)
  "缓存可执行文件路径，键为 (current-directory . target)")

(defvar smart-path/executable-cache-max-size 5000
  "最大缓存条目数")

(defun smart-path/cache--executable-result (key result)
  (when (> (hash-table-count smart-path/executable-cache) smart-path/executable-cache-max-size)
    ;; 简单策略：清除最早缓存的100个条目
    (cl-loop repeat 100
             for k = (car (hash-table-keys smart-path/executable-cache))
             do (remhash k smart-path/executable-cache)))
  (puthash key result smart-path/executable-cache))

(defun smart-path/find-node-modules-bin (target &optional win-target)
  (let* ((local-target (if (smart-path/current-in-windows-path)
                           (or win-target (format "%s.exe"  target))
                         target))
         (local-node-modules-target  (format "node_modules/.bin/%s" local-target))
         (cache-key (cons default-directory local-node-modules-target)))
    (message "local-target %s" local-target)
    (message "local-node-modules-target %s" local-node-modules-target)
    (or  (gethash cache-key smart-path/executable-cache)
         (let ((result (smart-path/smart--find-project-bin local-node-modules-target local-target)))
           (if result
               (progn
                 (message (format "%s: %s" local-node-modules-target result))
                 (smart-path/cache--executable-result cache-key result)
                 result)
             (message "not found=-==============="))))))

(defun smart-path/find-bin (target &optional win-target)
  (let* ((local-target (if (smart-path/current-in-windows-path) (or win-target (format "%s.exe"  target)) target))
         (cache-key (cons default-directory local-target)))
    (or  (gethash cache-key smart-path/executable-cache)
         (let ((result (executable-find local-target)))
           (when result
             (message (format "fidned: %s" result))
             (smart-path/cache--executable-result cache-key result)
             result)))))


;; 延迟求值包装器
(defun smart-path/delayed-find (finder target &optional win-target)
  "创建延迟求值的查找函数"
  (lambda ()
    (funcall finder target win-target)))

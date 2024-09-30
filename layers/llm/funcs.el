(defvar gptel-lookup--history nil)

(defun spacemacs/gptel-ask (prompt)
  (interactive (list (read-string "Ask: " nil gptel-lookup--history)))
  (when (string= prompt "") (user-error "A prompt is required."))
  (gptel-request
      prompt
    :callback
    (lambda (response info)
      (if (not response)
          (message "gptel-lookup failed with message: %s" (plist-get info :status))
        (with-current-buffer (get-buffer-create "*gptel-ask*")
          (let ((inhibit-read-only t))
            (erase-buffer)
            (insert response))
          (special-mode)
          (display-buffer (current-buffer)
                          `((display-buffer-in-side-window)
                            (side . right))))))))
;; (window-width. ,#'fit-window-to-buffer)

(defun spacemacs//gptel-setup-global-bindings ()
  "Define keys bindings globally of aichat functions"
  (spacemacs/declare-prefix "ai"  "aichat")
  (spacemacs/set-leader-keys
    "aia" 'spacemacs/gptel-ask))

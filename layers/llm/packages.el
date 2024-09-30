(defconst llm-packages
  '(gptel))

(defun llm/init-gptel ()
  (use-package gptel
    :defer t
    :commands (gptel-request)
    :config
    (setq gptel-model "qwen-plus")
    (setq gptel-backend (gptel-make-openai "qwen-plus"
                          :models '("qwen-plus"
                                    "qwen-long"
                                    "qwen-turbo"
                                    "qwen-max"
                                    "qwen-max-longcontext")
                          :key #'gptel-api-key
                          :host "dashscope.aliyuncs.com"
                          :endpoint "/compatible-mode/v1/chat/completions"))
    :init
    (spacemacs//gptel-setup-global-bindings)))

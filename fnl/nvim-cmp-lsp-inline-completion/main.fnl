(module nvim-cmp-lsp-inline-completion.main
  {require {core aniseed.core
            cmp cmp}})

(def source {})

(fn get-inline-completions-for-docker-lsp [lsp-client params]
  (let [context {:context 
                 {:uri (.. (-> lsp-client (. :workspace_folders) (core.first) (. :uri)) "/Dockerfile")
                  :position (-> params (. :context) (. :cursor))
                  :triggerKind (-> params (. :completion_context) (. :triggerKind))}}
        response (lsp-client.request_sync 
                   "textDocument/inlineCompletion" 
                   context)]
    (if response.err
      (do
        (core.println response.err)
        [])
      (->> response.result
           (core.map #(core.assoc {} :label (. $1 :insertText)))))))

(fn get-client-by-name [s] 
  (core.some 
    (fn [client] (when (= client.name s) client)) (vim.lsp.get_clients)))

(fn source.complete [self params callback]
  (let [lsp (get-client-by-name "docker_lsp")]
    (if lsp
      (callback (get-inline-completions-for-docker-lsp lsp params)) 
      (callback [{:label "crystal faery"}]))))

(defn init []
  (cmp.register_source "lsp-inline-completions" source))


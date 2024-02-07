(module nvim-cmp-lsp-inline-completion.main
  {require {core aniseed.core
            cmp cmp}})

(def source {})

(fn get-client-by-name [s] 
  (core.some 
    (fn [client] (when (= client.name s) client)) (vim.lsp.get_clients)))

(fn get-root-uri [lsp-client]
  (-> lsp-client (. :workspace_folders) (core.first) (. :uri)))

(fn get-inline-completions-for-docker-lsp 
  [lsp-client 
   params]
  (let [{:context
         {:filetype filetype
          :cursor cursor
          :bufnr bufnr}
         :completion_context
         {: triggerKind}} params
        context {:context 
                 {:uri (.. "file://" (vim.api.nvim_buf_get_name bufnr))
                  :position cursor
                  : triggerKind}}
        response (lsp-client.request_sync 
                   "textDocument/inlineCompletion" 
                   context)]
    (core.println context)
    (if response.err
      (do
        (core.println response.err)
        [])
      (->> response.result
           (core.map #(core.assoc {} :label (. $1 :insertText)))))))

(fn source.complete [self params callback]
  (let [lsp (get-client-by-name "docker_lsp")]
    (if lsp
      (callback (get-inline-completions-for-docker-lsp lsp params)) 
      (callback [{:label "crystal faery"}]))))

(defn init []
  (cmp.register_source "lsp-inline-completions" source))


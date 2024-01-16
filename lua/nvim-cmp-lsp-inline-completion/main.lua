local _2afile_2a = "fnl/nvim-cmp-lsp-inline-completion/main.fnl"
local _2amodule_name_2a = "nvim-cmp-lsp-inline-completion.main"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local cmp, core = require("cmp"), require("nvim-cmp-lsp-inline-completion.aniseed.core")
do end (_2amodule_locals_2a)["cmp"] = cmp
_2amodule_locals_2a["core"] = core
local source = {}
_2amodule_2a["source"] = source
local function get_inline_completions_for_docker_lsp(lsp_client, params)
  local context = {context = {uri = (core.first(lsp_client.workspace_folders).uri .. "/Dockerfile"), position = params.context.cursor, triggerKind = params.completion_context.triggerKind}}
  local response = lsp_client.request_sync("textDocument/inlineCompletion", context)
  if response.err then
    core.println(response.err)
    return {}
  else
    local function _1_(_241)
      return core.assoc({}, "label", (_241).insertText)
    end
    return core.map(_1_, response.result)
  end
end
local function get_client_by_name(s)
  local function _3_(client)
    if (client.name == s) then
      return client
    else
      return nil
    end
  end
  return core.some(_3_, vim.lsp.get_clients())
end
source.complete = function(self, params, callback)
  local lsp = get_client_by_name("docker_lsp")
  if lsp then
    return callback(get_inline_completions_for_docker_lsp(lsp, params))
  else
    return callback({{label = "crystal faery"}})
  end
end
local function init()
  return cmp.register_source("lsp-inline-completions", source)
end
_2amodule_2a["init"] = init
return _2amodule_2a
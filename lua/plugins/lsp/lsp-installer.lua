local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- Inicialização do servidor
lsp_installer.setup {}

-- Aplicar a mesma configuração a todos os servidores quando possível 
lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
    }
)


-- 3. Loop para instalar todos os servidores 
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {}
end

-- Para fazer a instalalação individual e personalizada de cada servidor
-- é preciso comentar a anterior e descomentar essa:

-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end
--
-- local lspconfig = require("lspconfig")
--
-- local servers = { "jsonls", "sumneko_lua" }
--
-- lsp_installer.setup {
-- 	ensure_installed = servers
-- }
--
-- for _, server in pairs(servers) do
-- 	local opts = {
-- 		on_attach = require("user.lsp.handlers").on_attach,
-- 		capabilities = require("user.lsp.handlers").capabilities,
-- 	}
-- 	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
-- 	if has_custom_opts then
-- 	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
-- 	end
-- 	lspconfig[server].setup(opts)
-- end

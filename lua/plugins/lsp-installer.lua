-- Configuração default do lsp-installer
local present, lsp_installer = pcall(require, "nvim-lsp-installer")
if not present then
   return
end

require("nvim-lsp-installer").setup {
    ensure_installed = {},
    automatic_installation = false,
    ui = {
        check_outdated_servers_on_open = true,
        border = "none",
        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },
  max_concurrent_installers = 4,
}


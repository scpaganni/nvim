local status_ok, color_scheme = pcall(require, 'dracula')
if not status_ok then
  return
end

vim.cmd[[colorscheme dracula]]

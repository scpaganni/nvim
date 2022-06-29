local status_ok, onerdar = pcall(require, "onedark")
if not status_ok then
  return
end

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

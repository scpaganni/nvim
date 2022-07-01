local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

-- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- My plugins here
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'numToStr/Comment.nvim', config = lua_path"comment" }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua', config = lua_path"nvim-tree" }
  use { 'akinsho/bufferline.nvim', config = lua_path"bufferline" }
  use { 'moll/vim-bbye' }
  use { 'nvim-lualine/lualine.nvim', config = lua_path"lualine" }
  use { 'akinsho/toggleterm.nvim', config = lua_path"toggleterm" }
  use { 'ahmedkhalf/project.nvim', config = lua_path"project" }
  use { 'lewis6991/impatient.nvim', config = lua_path"impatient" }
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'folke/which-key.nvim', config = lua_path"which-key" }

  -- Colorschemes
  use { 'navarasu/onedark.nvim' }

  -- cmp plugins
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-nvim-lsp' }

  -- snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }
  
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', config = lua_path"nvim-treesitter" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = "nvim-treesitter" }
  use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
  use { 'windwp/nvim-ts-autotag', after = "nvim-treesitter" }
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }

  -- Git
  use { 'lewis6991/gitsigns.nvim', config = lua_path"gitsigns" }

  -- Trouble
  use { 'folke/trouble.nvim', config = lua_path"trouble" }
  
  -- Colorizer
  use { 'norcalli/nvim-colorizer.lua', config = lua_path"nvim-colorizer" }

  -- LazyGit
  use { 'kdheepak/lazygit.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

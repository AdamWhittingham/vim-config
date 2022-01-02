-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer; close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  --------------------
  -- PLUGIN MANAGEMENT
  --------------------
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  --------------------
	-- TEXT MANIPULATION
  --------------------
  use "AndrewRadev/switch.vim" -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  use "AndrewRadev/splitjoin.vim" -- Quickly toggle between single and multi-line versions of common constructs
	use "tpope/vim-surround" -- Crazy good surround operations
	use "tpope/vim-abolish" -- Smartcase replacement with S
	use "tpope/vim-repeat" -- Make surround, abolish and more repeatable
  use "lukas-reineke/indent-blankline.nvim" -- Show indentation markers

  -------------------
  -- AUTOCOMPLETION
  -------------------
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use 'windwp/nvim-ts-autotag' -- Auto close HTML and XML tags too
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- Completion engine
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP based completions
	use 'andersevenrud/cmp-tmux' -- tmux completions
  use 'octaltree/cmp-look' -- dictionary completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -------------------
  -- UI
  -------------------
  use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
	use "AdamWhittingham/vim-adcode-theme" -- A nice coat of paint for everything
  use "kyazdani42/nvim-web-devicons" -- Map file types to icons for easier list-scanning
  use "nvim-telescope/telescope.nvim" -- Excellent UI for files, searching, everything
  use "nvim-telescope/telescope-media-files.nvim" -- Allow telescope to show media
  use "nvim-telescope/telescope-file-browser.nvim"
  use 'mbbill/undotree' -- Visualise the undo tree and make it easy to navigate
	use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "RRethy/vim-hexokinase", run = "make hexokinase" } -- Show colour swatches next to colour codes
  use "feline-nvim/feline.nvim" -- Quick and nice statusline
  use { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" } -- Show the class/method hierarchy to the cursor

  -------------------
  -- LANGUAGE SUPPORT
  -------------------
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use 'ray-x/lsp_signature.nvim' -- Pop up function definitions when typing a function call

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use 'nvim-treesitter/nvim-treesitter-refactor'  -- Add refactoring module for renaming
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Define text objects based on Treesitter
  use 'nvim-treesitter/playground' -- Show the parser tree and syntax under cursor
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -------------------
  -- Navigation
  -------------------
  use 'tpope/vim-projectionist' -- Map tools and actions based on the project
  use 'christoomey/vim-tmux-navigator' -- Seemless movement between panes and tmux
  use "AdamWhittingham/vim-copy-filename" -- Quick shortcuts for copying the file name, path and/or line number
  use 'ruanyl/vim-gh-line' -- Generate and copy the github/gitlab repo URL for the current line

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


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

return packer.startup({function(use)
  --------------------
  -- PLUGIN MANAGEMENT
  --------------------
  use "wbthomason/packer.nvim"  -- Have packer manage itself
  use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"   -- Useful lua functions used ny lots of plugins

  --------------------
  -- TEXT MANIPULATION
  --------------------
  use "AndrewRadev/switch.vim"              -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  use "AndrewRadev/splitjoin.vim"           -- Quickly toggle between single and multi-line versions of common constructs
  use "johmsalas/text-case.nvim"            -- Smartcase replacement with S
  use "lukas-reineke/indent-blankline.nvim" -- Show indentation markers
  use "kylechui/nvim-surround"              -- Provide surrounding bindings
  use "gbprod/yanky.nvim"                   -- Paste previously yanked content

  -------------------
  -- AUTOCOMPLETION
  -------------------
  use "windwp/nvim-autopairs"     -- Autopairs, integrates with both cmp and treesitter
  use 'windwp/nvim-ts-autotag'    -- Auto close HTML and XML tags too
  use "numToStr/Comment.nvim"     -- Easily comment stuff

  -- cmp plugins
  use "hrsh7th/nvim-cmp"          -- Completion engine
  use "hrsh7th/cmp-buffer"        -- buffer completions
  use "hrsh7th/cmp-path"          -- path completions
  use "hrsh7th/cmp-cmdline"       -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"  -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"      -- LSP based completions
  use 'andersevenrud/cmp-tmux'    -- tmux completions
  use 'octaltree/cmp-look'        -- dictionary completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -------------------
  -- UI
  -------------------
  use { "AdamWhittingham/vim-adcode-theme", branch = 'depalette' }             -- A nice coat of paint for everything
  use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } } -- Excellent start screen framework
  use 'mbbill/undotree'                                                      -- Visualise the undo tree and make it easy to navigate
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }  -- Show git diff in the gutter
  use 'DarwinSenior/nvim-colorizer.lua'                                      -- Fork of colorizer with VirtualText
  use "feline-nvim/feline.nvim"                                              -- Quick and nice statusline
  use "folke/which-key.nvim"                                                 -- Help learn/relearn/remember key bindings with a handy pop up
  use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }          -- show code hierarchy of item under cursor
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }       -- Better diff view

  use {
  'nvim-telescope/telescope.nvim',                  -- Telescope plus the plugins that make it faster
    requires = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      "sharkdp/fd",
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'nvim-telescope/telescope-dap.nvim',
    }
  }

  -------------------
  -- LANGUAGE SUPPORT
  -------------------

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use "jose-elias-alvarez/null-ls.nvim"             -- for formatters and linters
  use "ray-x/lsp_signature.nvim"                    -- Pop up function definitions when typing a function call
  use "gpanders/editorconfig.nvim"                  -- Obey editorconfig files
  use({ "glepnir/lspsaga.nvim", branch = "main", }) -- Better UI around renames and LSP diagnistics
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Show LSP diagnistics on lines for more comprehensive debugging
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_text = false, virtual_lines = false, })
    end,
  })

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use "nvim-treesitter/nvim-treesitter-textobjects" -- Define text objects based on Treesitter
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Make commenting context aware, so it works better in compound filetypes like JSX
  use "nvim-treesitter/playground"                  -- Show details of treesitter and highlighting

  -- Debugging
  use "mfussenegger/nvim-dap"                       -- Debug Anything Protocol bindings
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }   -- Lovely UI for DAP output
  use "theHamsta/nvim-dap-virtual-text"             -- Show debug values in virtual text
  use "leoluz/nvim-dap-go"                          -- Bindings for Delve, the go debugger
  use "suketa/nvim-dap-ruby"                        -- Bindings for ruby-debug

  -------------------
  -- Navigation
  -------------------
  use "tpope/vim-projectionist"                     -- Map tools and actions based on the project
  use "christoomey/vim-tmux-navigator"              -- Seemless movement between panes and tmux
  use "AdamWhittingham/vim-copy-filename"           -- Quick shortcuts for copying the file name, path and/or line number
  use "ruanyl/vim-gh-line"                          -- Generate and copy the github/gitlab repo URL for the current line

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

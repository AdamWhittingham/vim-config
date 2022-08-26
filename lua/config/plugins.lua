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
  use "AndrewRadev/switch.vim"  -- Quickly toggle between common alternative layouts for strings, arrays, etc.
  use "AndrewRadev/splitjoin.vim" -- Quickly toggle between single and multi-line versions of common constructs
  use "tpope/vim-abolish"       -- Smartcase replacement with S
  use "tpope/vim-repeat"        -- Make surround, abolish and more repeatable
  use "lukas-reineke/indent-blankline.nvim" -- Show indentation markers

  -- Paste previously yanked content
  use {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({
        picker = {
          select = { action = nil },
          telescope = { mappings = nil },
        },
      })
    end,
  }

  -- Provide surrounding bindings
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({ })
    end
  })

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
  use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } } -- Excellent start screen framework
  use "AdamWhittingham/vim-adcode-theme"            -- A nice coat of paint for everything
  use "kyazdani42/nvim-web-devicons"                -- Map file types to icons for easier list-scanning
  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } } -- Even faster FZF
  use 'mbbill/undotree'                             -- Visualise the undo tree and make it easy to navigate
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } } -- Show git diff in the gutter
  use 'DarwinSenior/nvim-colorizer.lua'             -- Fork of colorizer with VirtualText
  use "feline-nvim/feline.nvim"                     -- Quick and nice statusline
  use "folke/which-key.nvim"                        -- Help learn/relearn/remember key bindings with a handy pop up
  use { "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" } -- Show code hierarchy to item under cursor

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
  use "editorconfig/editorconfig-vim"               -- Obey editorconfig files
  use {
    "ThePrimeagen/refactoring.nvim",                -- Refactoring tools
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Show LSP diagnistics on lines for more comprehensive debugging
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = false,
      })
    end,
  })

  use({
    "glepnir/lspsaga.nvim",                         -- Better UI around renames and LSP diagnistics
    branch = "main",
    config = function()
      require("lspsaga").init_lsp_saga({
        code_action_lightbulb = { enable = false },
      })
    end,
  })

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      'nvim-neotest/neotest-go',
      'haydenmeade/neotest-jest',
    },
  }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use "nvim-treesitter/nvim-treesitter-refactor"    -- Add refactoring module for renaming
  use "nvim-treesitter/nvim-treesitter-textobjects" -- Define text objects based on Treesitter
  use "nvim-treesitter/playground"                  -- Show the parser tree and syntax under cursor
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Make commenting context aware, so it works better in compound filetypes like JSX

  -- Debugging
  use "mfussenegger/nvim-dap"                 -- Debug Anything Protocol bindings
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }   -- Lovely UI for DAP output
  use "theHamsta/nvim-dap-virtual-text"       -- Show debug values in virtual text
  use "leoluz/nvim-dap-go"                    -- Bindings for Delve, the go debugger
  use "suketa/nvim-dap-ruby"                  -- Bindings for ruby-debug

  -------------------
  -- Navigation
  -------------------
  use "tpope/vim-projectionist"               -- Map tools and actions based on the project
  use "christoomey/vim-tmux-navigator"        -- Seemless movement between panes and tmux
  use "AdamWhittingham/vim-copy-filename"     -- Quick shortcuts for copying the file name, path and/or line number
  use "ruanyl/vim-gh-line"                    -- Generate and copy the github/gitlab repo URL for the current line

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

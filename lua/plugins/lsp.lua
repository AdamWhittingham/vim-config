local installed_servers = {
  'bashls',
  'cssls',
  'dockerls',
  'html',
  'jsonls',
  'sumneko_lua',
  'yamlls',
}

if vim.fn.executable('go') == 1 then
  table.insert(installed_servers, "gopls")
end

if vim.fn.executable('ruby') == 1 then
  table.insert(installed_servers, "solargraph")
end

return {
  { -- Obey editorconfig files -- can be retired after nvim 0.9
    "gpanders/editorconfig.nvim",
    lazy = false,
},

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
      },

      -- TODO: Load these by convention instead
      servers = {
        sumneko_lua = require("config.lsp.settings.sumneko_lua"),
        jsonls = require("config.lsp.settings.jsonls"),
      },

      -- Mapping of server => options for that server
      -- ["*"] can be used to act as a fallback for any server
      setup = {},
    },

    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = require("config.lsp.handlers").on_attach

      local function setup(server)
        local server_opts = opts.servers[server] or {}
        server_opts.capabilities = capabilities
        server_opts.on_attach = on_attach

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      local ensure_installed = {}
      for server, server_opts in pairs(opts.servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  -- Install LSP Serves and tools
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = installed_servers,
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
    cofig = true,
  },

  -- Pop up function definitions when typing a function call
  {
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true,
      doc_lines = 5,
      max_height = 6,
      max_width = 80,
      hint_prefix = " ",
      hi_parameter = "LspSignatureActiveParameter",
      floating_window = false,
    }
  },

  -- Better UI around renames and LSP diagnistics
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      symbol_in_winbar = {
        enable = false,
      },
    }
  },

  { "SmiteshP/nvim-navic", lazy = false },

  -- Treesitter
  { -- Syntax parsing and highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = require("config.treesitter"),
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", -- Define text objects based on Treesitter
    dependencies = { "nvim-treesitter"},
  },
  "nvim-treesitter/playground", -- Show details of treesitter and highlighting
  "andymass/vim-matchup", -- Extend % for more languages
}

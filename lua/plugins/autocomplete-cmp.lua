return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",        -- buffer completions
      "hrsh7th/cmp-path",          -- path completions
      "hrsh7th/cmp-cmdline",       -- cmdline completions
      "saadparwaiz1/cmp_luasnip",  -- snippet completions
      "hrsh7th/cmp-nvim-lsp",      -- LSP based completions
      'andersevenrud/cmp-tmux',    -- tmux completions
      'octaltree/cmp-look',        -- dictionary completions
    },
    opts = function()
      local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer", keyword_length = 2, max_item_count = 8 },
          { name = "tmux", keyword_length = 5, max_item_count = 5, option = { all_panes = true } },
          { name = "look", keyword_length = 3, max_item_count = 5 },
        }),
        formatting = {
          --fields = { "abbr", "kind", "menu" },
          fields = { "kind", "abbr" },
          format = function(entry, vim_item)
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            vim_item.menu = ({
              buffer = "B",
              nvim_lsp = "L",
              luasnip = "S",
              path = "P",
              tmux = "T",
              look = "D",
            })[entry.source.name]
            return vim_item
          end
        },
        experimental = {
          ghost_text = {
            hl_group = "ghostText",
          },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
      }
    end,
  },
}

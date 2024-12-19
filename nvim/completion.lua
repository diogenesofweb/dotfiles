return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      -- 'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
      {
        "L3MON4D3/LuaSnip",
        version = "1.*",
        build = "make install_jsregexp",
        config = function()
          -- svelte snippets should not extend any other snippets ('js', 'css') in snips/package.json

          local luasnip = require("luasnip")
          local filetype_functions = require('luasnip.extras.filetype_functions')

          luasnip.setup({
            history = false,
            delete_check_events = "TextChanged",
            ft_func = filetype_functions.from_pos_or_filetype,
            load_ft_func = filetype_functions.extend_load_ft({
              svelte = { "javascript", "css" }
            }),
          })

          require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
        end,
      },
    },
    opts = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        -- enabled = function()
        --   local context = require 'cmp.config.context'
        --   if vim.api.nvim_get_mode().mode == 'c' then
        --     return true
        --   else
        --     return not context.in_treesitter_capture("comment")
        --         and not context.in_syntax_group("Comment")
        --   end
        -- end,
        preselect = cmp.PreselectMode.None, -- for Svelte
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- ['<C-h>'] = cmp.mapping.abort(),
          -- ["<C-l>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }),
          ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp_signature_help", keyword_length = 1 },
          -- { name = 'path' },
          -- }, {
          { name = 'nvim_lsp',                keyword_length = 1 },
          -- { name = 'luasnip',                 max_item_count = 5, keyword_length = 1 },
          { name = 'luasnip',                 keyword_length = 1 },
        }, {
          { name = 'buffer', keyword_length = 3, max_item_count = 10 },
        }),
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
          end,
        },
        experimental = {
          -- ghost_text = {
          --   hl_group = "LspCodeLens",
          -- },
        },
      }
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
}

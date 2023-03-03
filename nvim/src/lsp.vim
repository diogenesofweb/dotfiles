set completeopt=menu,menuone,noselect

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.svelte = ['javascript']
let g:vsnip_filetypes.typescript = ['javascript']
let g:vsnip_snippet_dir = expand("~/.config/nvim/vsnips/snippets")

lua << EOF

local nvim_lsp = require('lspconfig')
local builtin = require('telescope.builtin')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'Y', vim.diagnostic.open_float, { noremap=true, silent=true, desc='Open float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap=true, silent=true, desc='Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap=true, silent=true, desc='Next diagnostic' })
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap=true, silent=true, buffer=bufnr, desc='Declaration' })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr, desc='Definition' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap=true, silent=true, buffer=bufnr, desc='Implementation' })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { noremap=true, silent=true, buffer=bufnr, desc='Type Definition' })
  vim.keymap.set('n', 'gr', builtin.lsp_references, { noremap=true, silent=true, buffer=bufnr, desc='References' })
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local lsp_flags = { debounce_text_changes = 150, }

nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  filetypes = {"json", "jsonc"},
  settings = {
    json = {
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = {"tsconfig*.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = {"now.json", "vercel.json"},
          url = "https://json.schemastore.org/now.json"
        },
      }
    }
  }
}

-- local function ts_organize_imports(bufnr)
--   if not bufnr then bufnr = vim.api.nvim_get_current_buf() end
--   local params = {
--       command = "_typescript.organizeImports",
--       arguments = {vim.api.nvim_buf_get_name(bufnr)},
--       title = ""
--   }
--   vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, 500)
-- end

-- nvim_lsp.tsserver.setup {
--   filetypes = { "javascript", "typescript" },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
--   -- init_options = {
--   --   preferences = {importModuleSpecifierEnding = "js"},
--   -- },
--   commands = {
--     OrganizeImports = { ts_organize_imports, description = "Organize Imports" },
--   }
-- }
require("typescript").setup({
    disable_commands = false,
    debug = false,
    go_to_source_definition = { fallback = true, },
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
      -- init_options = {
      --   preferences = {importModuleSpecifierEnding = "js"},
      -- },
    },
})


nvim_lsp.svelte.setup {
  on_attach = function (client, bufnr) 
    client.server_capabilities.completionProvider.triggerCharacters = {
      ".", "\"", "'", "`", "/", "@", "<",
      -- ">",
      "*", "#", "$", "+", "^", "(", "[", "@", "-",
      ":", "|",
    }

    return on_attach(client, bufnr)
  end,

  capabilities = capabilities,
  flags = lsp_flags,

  -- settings = { 
  --   svelte = {
  --     plugin = {
  --       svelte = { useNewTransformation = true },
  --       html = {emmet=false},
  --       css = {emmet=false},
  --     },
  --   },
  -- },
}

nvim_lsp.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'css', 'scss', 'postcss'},
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'html', 'cssls', 'vimls', 'sqlls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  }
end


util = require "lspconfig/util"
nvim_lsp.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  cmd = {'gopls','serve'},
  -- cmd = {'gopls','--remote=auto'},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'

cmp.setup({
  enabled = function()
      local context = require 'cmp.config.context'
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment") 
          and not context.in_syntax_group("Comment")
      end
    end,

  preselect = cmp.PreselectMode.None, -- for Svelte

  -- matching = { disallow_partial_fuzzy_matching = false },

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },

  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }), 
  },

  sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help", keyword_length = 1},
    { name = 'path' },
  }, {
    { name = 'nvim_lsp', keyword_length = 3},
    { name = 'vsnip', max_item_count = 8, keyword_length = 1},
  }, {
    { name = 'buffer', keyword_length = 3, max_item_count = 10},
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

  -- view = { entries = 'native' }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})



require('nvim-autopairs').setup{}
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = false,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
  }
)


function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

EOF

autocmd BufWritePre *.go lua go_org_imports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

au BufRead,BufNewFile *.postcss                set filetype=scss


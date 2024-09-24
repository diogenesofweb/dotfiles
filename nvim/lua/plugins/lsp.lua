return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "jose-elias-alvarez/typescript.nvim",
      "nvim-telescope/telescope.nvim",

      "folke/which-key.nvim",
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        virtual_text = true,
        signs = false,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      },
      autoformat = false,
    },
    config = function()
      local nvim_lsp = require('lspconfig')
      local builtin = require('telescope.builtin')

      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      -- local opts = { noremap=true, silent=true }
      vim.keymap.set('n', 'Y', vim.diagnostic.open_float, { noremap = true, silent = true, desc = 'Open float' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = 'Prev diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = 'Next diagnostic' })
      -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
          { noremap = true, silent = true, buffer = bufnr, desc = 'Declaration' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
          noremap = true,
          silent = true,
          buffer = bufnr,
          desc = 'Definition'
        })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
          { noremap = true, silent = true, buffer = bufnr, desc = 'Implementation' })
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition,
          { noremap = true, silent = true, buffer = bufnr, desc = 'Type Definition' })
        vim.keymap.set('n', 'gr', builtin.lsp_references, {
          noremap = true,
          silent = true,
          buffer = bufnr,
          desc = 'References'
        })


        vim.keymap.set('n', 'gh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
          { noremap = true, silent = true, buffer = bufnr, desc = 'Toggle Inlay Hints' })
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
        filetypes = { "json", "jsonc" },
        settings = {
          json = {
            schemas = {
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json"
              },
              {
                fileMatch = { "tsconfig*.json" },
                url = "https://json.schemastore.org/tsconfig.json"
              },
              {
                fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
                url = "https://json.schemastore.org/prettierrc.json"
              },
              {
                fileMatch = { "now.json", "vercel.json" },
                url = "https://json.schemastore.org/now.json"
              },
            }
          }
        }
      }

      local inlay_hints_settings = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "literal",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      }

      -- require("typescript").setup({
      --   disable_commands = false,
      --   debug = false,
      --   go_to_source_definition = { fallback = true, },
      --   server = {
      --     on_attach = on_attach,
      --     capabilities = capabilities,
      -- init_options = {
      --   preferences = {importModuleSpecifierEnding = "js"},
      -- },
      --     settings = {
      --       typescript = {
      --         inlayHints = inlay_hints_settings,
      --       },
      --       javascript = {
      --         inlayHints = inlay_hints_settings,
      --       },
      --     }
      --   },
      -- })

      local manage_imports = function()
        local wk = require("which-key")
        wk.register({
          ["<leader>l"] = {
            o = { function()
              vim.lsp.buf.code_action({ apply = true, context = { only = { "source.organizeImports" }, }, })
            end,
              "Organize Imports"
            },

            r = { function()
              vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused" }, }, })
            end,
              "Remove Unused Imports"
            },
          },
        })
      end

      -- nvim_lsp.tsserver.setup {
      nvim_lsp.ts_ls.setup {
        -- on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,

        settings = {
          typescript = {
            inlayHints = inlay_hints_settings,
          },
          javascript = {
            inlayHints = inlay_hints_settings,
          },
          completions = {
            completeFunctionCalls = true,
          },
        },

        on_attach = function(client, bufnr)
          manage_imports()
          return on_attach(client, bufnr)
        end,
      }


      nvim_lsp.svelte.setup {
        -- on_attach = on_attach,
        on_attach = function(client, bufnr)
          -- HACK: to make Svelte files work with LSP when updates are made to project ts files
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })


          manage_imports()

          return on_attach(client, bufnr)
        end,

        -- on_attach = function(client, bufnr)
        --   client.server_capabilities.completionProvider.triggerCharacters = { ".", "\"", "'", "`", "/", "@", "<", "*", "#", "$", "+", "^", "(", "[", "@", "-", ":", "|", }
        --   return on_attach(client, bufnr)
        -- end,

        capabilities = capabilities,
        flags = lsp_flags,
      }

      -- nvim_lsp.emmet_ls.setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   filetypes = { 'html', 'css', 'scss', 'postcss' },
      -- })

      local servers = { 'html', 'cssls', 'vimls', 'sqlls' }
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = lsp_flags,
        }
      end


      local util = require "lspconfig/util"
      nvim_lsp.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        cmd = { 'gopls', 'serve' },
        -- cmd = {'gopls','--remote=auto'},
        filetypes = { "go", "gomod" },
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

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
        end
      })

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

      -- vim.cmd([[
      --   au BufRead,BufNewFile *.postcss set filetype=scss
      -- ]])
    end,
  }
}

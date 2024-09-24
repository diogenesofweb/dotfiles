return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    local wk = require("which-key")

    local keymaps = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      -- ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      -- ["<leader><tab>"] = { name = "+tabs" },

      ["<leader>"] = {
        [';'] = { "<cmd>Telescope commands<cr>", "Commands" },
        -- ['`'] = {"<cmd>sp +term<cr>", "Terminal"},

        q = { "<cmd>mksession!|q<cr>", "Save session & Quit" },
        -- x = { "<cmd>xa<cr>", "Save all & Quit" },
        -- c = {"<cmd>bd<cr>", "Close Buffer"},
        c = { "<cmd>bp|bd #<cr>", "Close Buffer" },
        w = { "<cmd>w<cr>", "Save (Write)" },

        -- y = { "<cmd>Format<cr>", "Format-prettier" },
        y = { function() require("conform").format({ async = true, lsp_fallback = true }) end, "Conform Format" },
        h = { "<cmd>noh<cr>", "No highlighting" },

        ['2'] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<cr>zz", "Next Problem" },
        N = { "<cmd>lua vim.diagnostic.goto_prev()<cr>zz", "Prev Problem" },
        -- u = {"<cmd>lua vim.diagnostic.open_float()<cr>", "Open float (diagnostic)"},

        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
        d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics", },

        m = {
          name = "Mini",
          m = { "<cmd>lua MiniFiles.open()<cr>", "Mini FIles" },
        },

        e = { "<cmd>Telescope file_browser path=%:p:h<cr>", "File Browser" },
        -- e = {"<cmd>Telescope file_browser previewer=false path=%:p:h theme=dropdown layout_config={height=0.8}<cr>", "File Browser"},
        b = { "<cmd>Telescope buffers<cr>", "List Buffers" },
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        s = { "<cmd>Telescope live_grep<cr>", "Text Search" },
        g = { "<cmd>Telescope grep_string<cr>", "Find String" },
        p = { "<cmd>Telescope resume<cr>", "Previous Picker" },
        k = { "<cmd>Telescope quickfix<cr>", "Quickfix (qflist)" },
        -- R = {"<cmd>Telescope oldfiles<cr>", "List Recent Files"},
        t = { "<cmd>Telescope<cr>", "Telescope builtin" },

        v = { "<cmd>vsplit <cr>", "V Split" },

        U = {
          name = "UI",
          c = { '<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>', "Toggle Colorcolumn" },
          n = { "<cmd>set nu!<cr>", "Toggle Line Numbers" },
          r = { "<cmd>set rnu!<cr>", "Toggle Relative Line Numbers" },
        },

        l = {
          name = "LSP",
          -- h = { "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", "Inlay Hints" },

          e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float (diagnostic)" },
          -- o = { "<cmd>OrganizeImports<cr>", "Organize Imports" },
          f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
          i = { "<cmd>LspInfo<cr>", "Info" },
          I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
          l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
          q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
          -- r = {"<cmd>Telescope lsp_references<cr>", "References"},
          -- s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
          S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
          n = {
            name = "Additional",
            k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
            a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder" },
            r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder" },
            l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folders" },
            d = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loclist" },
          },
        },
      },
    }

    -- wk.register(keymaps)
    local next = {
    {
      mode = { "n", "v" },
      -- { "<leader>U", group = "UI" },
      -- { "<leader>Uc", '<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>', desc = "Toggle Colorcolumn" },
      -- { "<leader>Un", "<cmd>set nu!<cr>", desc = "Toggle Line Numbers" },
      -- { "<leader>Ur", "<cmd>set rnu!<cr>", desc = "Toggle Relative Line Numbers" },

      { "<leader>l", group = "LSP" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open float (diagnostic)" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },

      { "<leader>m", group = "Mini" },
      { "<leader>mm", "<cmd>lua MiniFiles.open()<cr>", desc = "Mini FIles" },

      { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename Symbol" },
      { "<leader>N", "<cmd>lua vim.diagnostic.goto_prev()<cr>zz", desc = "Prev Problem" },
      { "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<cr>zz", desc = "Next Problem" },

      { "<leader>h", "<cmd>noh<cr>", desc = "No highlighting" },
      { "<leader>c", "<cmd>bp|bd #<cr>", desc = "Close Buffer" },
      { "<leader>v", "<cmd>vsplit <cr>", desc = "V Split" },
      { "<leader>q", "<cmd>mksession!|q<cr>", desc = "Save session & Quit" },
      { "<leader>w", "<cmd>w<cr>", desc = "Save (Write)" },

      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
      { "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>e", "<cmd>Telescope file_browser path=%:p:h<cr>", desc = "File Browser" },
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>g", "<cmd>Telescope grep_string<cr>", desc = "Find String" },
      { "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "Text Search" },
      { "<leader>p", "<cmd>Telescope resume<cr>", desc = "Previous Picker" },
      { "<leader>k", "<cmd>Telescope quickfix<cr>", desc = "Quickfix (qflist)" },
      { "<leader>t", "<cmd>Telescope<cr>", desc = "Telescope builtin" },
      { "<leader>2", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>;", "<cmd>Telescope commands<cr>", desc = "Commands" },

      { "<leader>y", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Conform Format" },

      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
    },
  }
    wk.add(next)

  end,
}

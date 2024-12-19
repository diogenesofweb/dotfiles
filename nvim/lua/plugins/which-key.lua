return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    local wk = require("which-key")

    -- wk.register(keymaps)
    local next = {
    {
      mode = { "n", "v" },
      -- { "<leader>U", group = "UI" },
      -- { "<leader>Uc", '<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>', desc = "Toggle Colorcolumn" },
      -- { "<leader>Un", "<cmd>set nu!<cr>", desc = "Toggle Line Numbers" },
      -- { "<leader>Ur", "<cmd>set rnu!<cr>", desc = "Toggle Relative Line Numbers" },

      { "<leader>l", group = "LSP" },
      -- { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
      -- { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>ls", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open float (diagnostic)" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format" },
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

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      ["javascript"] = { "prettierd", "prettier", stop_after_first = true },
      ["javascriptreact"] = { "prettierd", "prettier", stop_after_first = true  },
      ["typescript"] = { "prettierd", "prettier", stop_after_first = true },
      ["typescriptreact"] = {  "prettierd", "prettier", stop_after_first = true  },
      -- ["svelte"] = { { "prettierd", "prettier" } },
      ["css"] = { "prettierd", "prettier", stop_after_first = true },
      ["html"] = { "prettierd", "prettier", stop_after_first = true },
      ["json"] = { "prettierd", "prettier", stop_after_first = true },
      ["markdown"] = { "prettierd", "prettier", stop_after_first = true },
    },

    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}

lua << EOF

local vim = vim
local formatter = require("formatter")

local prettierConfig = function()
  return {
    exe = "prettierd", 
    args = {vim.api.nvim_buf_get_name(0)},
    -- exe = "./node_modules/.bin/prettier",
    -- args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true
  }
end

local formatterConfig = {}

local commonFT = {
  "css",
  "html",
  "javascript",
  "typescript",
  "markdown",
  "json"
}

for _, ft in ipairs(commonFT) do
  formatterConfig[ft] = {
    prettierConfig
  }
end

formatter.setup(
  {
    logging = false,
    filetype = formatterConfig
  }
)

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.md,*.html,*.css,*.json,*.js,*.ts FormatWrite
  autocmd BufWritePre *.svelte,*.go lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
]], true)

EOF

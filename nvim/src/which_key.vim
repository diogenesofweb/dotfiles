set timeoutlen=500

lua << EOF
local wk = require("which-key")

wk.register({
["<leader>"] = {

['/'] = {"<cmd>CommentToggle<cr>", "Comment Toggle"},
[';'] = {"<cmd>Telescope commands<cr>", "Commands"},
-- ['`'] = {"<cmd>sp +term<cr>", "Terminal"},

q = {"<cmd>mksession!<cr> | <cmd>q<cr>", "Save session & Quit"},
x = {"<cmd>xa<cr>", "Save all & Quit"},
c = {"<cmd>bd<cr>", "Close Buffer"},
w = {"<cmd>w<cr>", "Save (Write)"},

y = {"<cmd>Format<cr>", "Format-prettier"},
h = {"<cmd>noh<cr>", "No highlighting"},

['2'] = {"<cmd>Telescope lsp_document_symbols<cr>", "Doccument Symbols"},
['7'] = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Problem"},
['8'] = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Problem"},

a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action"},
r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol"},

-- e = {"<cmd>Lexplore<cr>", "Open Explorer"},
e = {"<cmd>Telescope file_browser theme=dropdown previewer=false<cr>", "File Browser"},
-- b = {"<cmd>Telescope buffers<cr>", "List Buffers"},
b = {"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "List Buffers"},
f = {"<cmd>Telescope find_files<cr>", "Find Files"},
s = {"<cmd>Telescope live_grep<cr>", "Text Search"},
k = {"<cmd>Telescope quickfix<cr>", "Quickfix (qflist)"},
t = {"<cmd>Telescope<cr>", "Telescope builtin"},
o = {"<cmd>Telescope oldfiles<cr>", "List Recent Files"},

v = {"<cmd>vsplit <cr>", "V Split"},
-- h = {"<cmd>split <cr>", "H Split"},

E = {
  name = 'File Explorer',
  w = {"<cmd>Lexplore<cr>", "Working Directory"},
  c = {"<cmd>Lexplore %:p:h<cr>", "Current File Directory"},
  },

-- B = {
--   name = 'Buffers',
--   b = {"<cmd>Telescope buffers<cr>", "List All Buffers"},
--   q = {"<cmd>bd<cr>", "Close Current Buffer"},
--   r = {"<cmd>w | %bd | e#<cr>", "Close All Buffers But Current"},
--   x = {"<cmd>%bdelete<cr>", "Close All Buffers"},
--   },

T = {
  name = "Telescope",
  p = {"<cmd>Telescope<cr>", "Builtin"},
  b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
  e = {"<cmd>Telescope file_browser<cr>", "File Browser"},
  f = {"<cmd>Telescope find_files<cr>", "Find File"},
  h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
  m = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
  o = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
  r = {"<cmd>Telescope registers<cr>", "Registers"},
  t = {"<cmd>Telescope live_grep<cr>", "Text"},
  s = {"<cmd>Telescope grep_string<cr>", "Find String"},
  k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
  c = {"<cmd>Telescope commands<cr>", "Commands"},
  q = {"<cmd>Telescope quickfix<cr>", "Quickfix list (qflist)"},
  },

-- U = {
--   name = "UI",
--   c = {'<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>', "Toggle Colorcolumn"},
--   n = {"<cmd>set nu!<cr>", "Toggle Line Numbers"},
--   r = {"<cmd>set rnu!<cr>", "Toggle Relative Line Numbers"},
--   },

l = {
  name = "LSP",
  a = {"<cmd>Telescope lsp_code_actions<cr>", "Code Action"},
  e = {"<cmd>Telescope diagnostics<cr>", "Errors", },
  w = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
  f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
  i = {"<cmd>LspInfo<cr>", "Info"},
  I = {"<cmd>LspInstallInfo<cr>", "Installer Info"},

  j = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic"},
  k = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic"},

  l = {"<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action"},
  q = {"<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix"},
  r = {"<cmd>Telescope lsp_references<cr>", "References"},
  R = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
  s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
  S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },

  n = { name = "Additional",
    k = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help"},
    a = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder"},
    r = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder"},
    l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folders"},
    d = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition"},
    e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Open float"},
    q = {"<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loclist"},
    },
  },
},

})

EOF

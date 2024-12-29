local map = vim.keymap.set
local default_opts = { silent = true, noremap = true }

map("i", "jj", "<Esc>", {})

-- Copy/Paste
map("v", "<leader>y", '"*y', default_opts)
map("n", "<leader>p", '"*p', default_opts)

-- Buffers
map("n", "<c-n>", "<cmd>bnext<CR>", default_opts)
map("n", "<c-p>", "<cmd>bprev<CR>", default_opts)
map("n", "<leader>q", ":b#|bd#<CR>", default_opts)
map("n", "<leader>w", ":w<CR>", default_opts)

-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)
-- map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", default_opts)
-- map("n", "[d", vim.diagnostic.goto_prev, default_opts)
-- map("n", "]d", vim.diagnostic.goto_next, default_opts)
-- map("n", "<leader>d", vim.diagnostic.open_float, default_opts)

vim.cmd("com! W w")
vim.cmd("com! Wq wq")
vim.cmd("com! WQ wq")

-- Sort
map("v", "<F9>", ":sort<CR>", default_opts)

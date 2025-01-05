local map = vim.keymap.set
local default_opts = { silent = true, noremap = true }

-- Esc
map("i", "jj", "<Esc>", {})

-- Copy/Paste
map("v", "<leader>y", '"*y', default_opts)
map("n", "<leader>p", '"*p', default_opts)

-- Buffers
map("n", "<c-n>", "<cmd>bnext<CR>", default_opts)
map("n", "<c-p>", "<cmd>bprev<CR>", default_opts)
-- map("n", "<leader>d", ":bd<CR>", default_opts) # TODO: This clashes with Telescope
map("n", "<leader>b", ":b#|bd#<CR>", default_opts)

-- Windows
map("n", "<leader>q", ":q<CR>", default_opts)
map("n", "<leader>w", ":w<CR>", default_opts)

-- Save
vim.cmd("com! W w")
vim.cmd("com! Wq wq")
vim.cmd("com! WQ wq")

-- Sort
map("v", "<F9>", ":sort<CR>", default_opts)

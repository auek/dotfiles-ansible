local builtin_require_ok, builtin = pcall(require, "telescope.builtin")

local map = vim.keymap.set
local default_opts = { silent = true, noremap = true }

-- Leader
map("i", "jj", "<Esc>", {})

-- NvimTree
map("n", "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", default_opts)

-- Copilot
map('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
-- TODO: Fix next/previous keymaps

vim.g.copilot_no_tab_map = true

-- Copy/Paste to clipboard
map("v", "<leader>y", '"*y', default_opts)
map("n", "<leader>p", '"*p', default_opts)

-- Buffers
map("n", "<c-n>", "<cmd>bnext<CR>", default_opts)
map("n", "<c-p>", "<cmd>bprev<CR>", default_opts)
map("n", "<leader>c", ":bd<CR>", default_opts)
map("n", "<leader><leader>c", ":b#|bd#<CR>", default_opts)
map("n", "<leader>w", ":w<CR>", default_opts)

-- Telescope
if builtin_require_ok then
  map("n", "<leader>ff", builtin.find_files, {})
  map("n", "<leader>fg", builtin.live_grep, {})
  map("n", "<leader>fo", builtin.oldfiles, {})
  map("n", "<leader>fh", builtin.help_tags, {})
  map("n", "<leader>ls", builtin.buffers, {})
  map("n", "<leader>ma", builtin.marks, {})
end

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", default_opts)

-- Close buffer
vim.cmd("com W w")
vim.cmd("com Wq wq")
vim.cmd("com WQ wq")

-- Sort
map("v", "<F9>", ":sort<CR>", default_opts)

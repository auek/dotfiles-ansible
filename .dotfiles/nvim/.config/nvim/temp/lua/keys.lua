local builtin = require("telescope.builtin")

local map = vim.keymap.set
local default_opts = { silent = true, noremap = true }

map("i", "jj", "<Esc>", {})

map("n", "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", default_opts)

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
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fo", builtin.oldfiles, {})
map("n", "<leader>fh", builtin.help_tags, {})
map("n", "<leader>ls", builtin.buffers, {})
map("n", "<leader>ma", builtin.marks, {})

-- Write with :W
vim.cmd("com W w")
vim.cmd("com Wq wq")
vim.cmd("com WQ wq")

-- Sort
map("v", "<F9>", ":sort<CR>", default_opts)

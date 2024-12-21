local builtin_require_ok, builtin = pcall(require, "telescope.builtin")

local map = vim.keymap.set
local default_opts = { silent = true, noremap = true }

local function define_command(cmd, replacement)
  if not vim.fn.exists(":" .. cmd) then
    vim.cmd("com! " .. cmd .. " " .. replacement)
  end
end

local copilot_enabled = vim.fn.exists(":Copilot")

-- Leader
map("i", "jj", "<Esc>", {})

-- NvimTree
map("n", "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", default_opts)

-- Copilot
if copilot_enabled then
  map('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
  map('i', '<M-]>', '<Plug>(copilot-next)')
  map('i', '<M-[>', '<Plug>(copilot-previous)')
  vim.g.copilot_no_tab_map = true
end


-- Copy/Paste
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
map("n", "[d", vim.diagnostic.goto_prev, default_opts)
map("n", "]d", vim.diagnostic.goto_next, default_opts)
map("n", "<leader>d", vim.diagnostic.open_float, default_opts)

-- TODO: This won't work
define_command("W", "w")
define_command("Wq", "wq")
define_command("WQ", "wq")

-- Sort
map("v", "<F9>", ":sort<CR>", default_opts)

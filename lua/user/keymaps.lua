local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<leader>wn", "<C-w>h", opts)
keymap("n", "<leader>we", "<C-w>j", opts)
keymap("n", "<leader>wi", "<C-w>k", opts)
keymap("n", "<leader>wo", "<C-w>l", opts)
keymap("n", "<leader>wc", "<C-w>c", opts)
keymap("n", "<leader>wv", ":vsp<cr>", opts)
keymap("n", "<leader>wh", ":sp<cr>", opts)


-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bo", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>==g", opts)
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>==g", opts)
keymap("n", "<A-S-Down>", "yy$p", opts)
keymap("n", "<A-S-Up>", "yyk$p", opts)

-- Insert --
-- Press jk fast to enter
--[[ keymap("i", "qq", "<ESC>", opts) ]]

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


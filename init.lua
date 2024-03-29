require('packer').startup()
require "user.lsp"
require "user.rust-tools"
require "user.cmp"
require "user.keymaps"
require "user.options"
require "user.plugins"
require "user.autopairs"
require "user.colorizer"
require "user.mason"
require "user.tree-sitter"
require "user.web-devicons"
require "user.bufdelete"
require "user.nvim-tree"
require "user.telescope"
require "user.comment"
require "user.better-escape"
require "user.toggleterm"
require "user.gitsigns"
--[[ require "user.utils" ]]
require "user.colors"
require "user.which-key"

require('rust-tools').inlay_hints.enable()
vim.cmd "colorscheme onedark"
--[[ vim.cmd "colorscheme nightfox" ]]
vim.cmd "set nohlsearch"

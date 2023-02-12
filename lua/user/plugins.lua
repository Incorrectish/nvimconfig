local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- Colorschemes
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"
    use 'navarasu/onedark.nvim'
    require('onedark').setup {
        style = 'deep'
    }
    require('onedark').load()

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "simrat39/rust-tools.nvim"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use "hrsh7th/vim-vsnip"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- better buffer deletion
    use "famiu/bufdelete.nvim"

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'skywind3000/asyncrun.vim'

    -- Indent blankline
    use "lukas-reineke/indent-blankline.nvim"

    -- trouble?
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Comments
    use "numToStr/Comment.nvim" -- Easily comment stuff

    -- Colorizer plugin(colors hex, rgb)
    use "NvChad/nvim-colorizer.lua"


    -- Which Key (key popups and stuff)
    use "folke/which-key.nvim"

    -- lua with packer.nvim
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    }

    -- toggle terminal
    use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("toggleterm").setup()
    end }

    -- nvim tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }
    --------------

    -- Color scheme
    use "liuchengxu/space-vim-theme"
    use 'marko-cerovac/material.nvim'
    use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }
    -- org mode
    use {
        'nvim-orgmode/orgmode', config = function()
            require('orgmode').setup {}
        end
    }
    require('orgmode').setup_ts_grammar()


    -- line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        require('lualine').setup()
    }

    -- Mason
    use { "williamboman/mason.nvim" }


    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use "tpope/vim-fugitive"
    use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end }
    ---- Michael's plugin to make hoffman easier
    use 'zhou-michael/cpp-javadoc'
    require('cpp-javadoc').setup({
        add_javadoc = '<leader>lcj', -- keybinding to add javadoc
        silent = true, -- whether or not to print error messages
        align = true, -- whether or not to align parameter descriptions
        left_spaces = 4, -- number of spaces between @param tag and parameter name
        right_spaces = 4, -- number of spaces between parameter name and description
    })


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

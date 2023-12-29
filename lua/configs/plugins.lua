-- Init Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins
require("lazy").setup({
    -- Theming
    'shaunsingh/nord.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },

    -- Git
    --{
    --    'WatcherWhale/git-worktree.nvim',
    --},
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-file-browser.nvim',
            "debugloop/telescope-undo.nvim",
        }
    },

    -- Command Line
    {
        'folke/noice.nvim',
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    -- Syntax Highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },
    'towolf/vim-helm',
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
            'folke/neodev.nvim',
            'simrat39/rust-tools.nvim'
        },
    },

    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            {
                'L3MON4D3/LuaSnip',
                version = "v2.*",
                build = "make install_jsregexp",
            },
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },

    -- Nice to Haves
    'chaoren/vim-wordmotion',
    {
        'iamcco/markdown-preview.nvim',
        build = "cd app & yarn install"
    },

    'tpope/vim-surround',
    'tpope/vim-commentary',

    {
        'folke/trouble.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
        },
    },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function() require('treesj').setup({}) end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },
    'David-Kunz/gen.nvim',
    {
        'f-person/git-blame.nvim',
        event = "VeryLazy",
        config = function()
            require("gitblame").setup({
                enabled = false,
            })
        end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    }
})

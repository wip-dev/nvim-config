vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
            'folke/neodev.nvim',
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = '[H]unks: go to [P]revious' })
                vim.keymap.set('n', '<leader>hn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = '[H]unks: go to [N]ext' })
                vim.keymap.set('n', '<leader>hl', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[H]unks: [L]ook at (preview) hunk' })
            end,
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'numToStr/Comment.nvim', opts = {} },
    -- { 'folke/which-key.nvim',  opts = {} },
    'catppuccin/nvim',
    'nvim-lualine/lualine.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'christoomey/vim-tmux-navigator',
    {
        'fatih/vim-go',
        config = function()
            vim.g.go_doc_keywordprg_enabled = 0
        end
    },
    -- {
    --     'jalvesaq/Nvim-R',
    --     config = function()
    --         vim.g.R_assign = 0
    --     end
    -- },
    -- {
    --     'Olical/conjure',
    --     dependencies = {
    --         'tpope/vim-dispatch',
    --         'clojure-vim/vim-jack-in',
    --         'radenling/vim-dispatch-neovim'
    --     },
    -- },
    -- 'tpope/vim-rhubarb',
}, {})


require('waseem.options')
require('waseem.remap')
-- require('waseem.r')

require('plugins.lsp')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.theme')
require('plugins.indent-blankline')

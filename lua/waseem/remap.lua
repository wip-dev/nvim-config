local conf_path  = '/home/waseem/.config/nvim/'
local init_path  = conf_path .. 'init.lua'

-- From kickstart
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Config files ("vimrc") access
vim.keymap.set('n', '<leader>rc', function() vim.cmd.edit(init_path) end, { desc = 'Edit vim[r][c]' })

-- Terminal abbreviations
local term_group = vim.api.nvim_create_augroup("TermGroup", { clear = true })
vim.api.nvim_create_autocmd("TermEnter", {
    group = term_group,
    callback = function()
        -- pnpm
        vim.keymap.set('t', ';pi', 'pnpm install', { buffer = true })
        vim.keymap.set('t', ';ps', 'pnpm start', { buffer = true })
        vim.keymap.set('t', ';prd', 'pnpm run dev', { buffer = true })
        vim.keymap.set('t', ';prb', 'pnpm run build', { buffer = true })

        -- git
        -- vim.keymap.set('t', ';gs', 'git status', { buffer = true })
        -- vim.keymap.set('t', ';gd', 'git diff', { buffer = true })
        -- vim.keymap.set('t', ';ga', 'git add .', { buffer = true })
        -- vim.keymap.set('t', ';gc', 'git commit -m ""<Left>', { buffer = true })

        -- clj
        vim.keymap.set('t', ';scw', 'npx shadow-cljs watch app', { buffer = true })
        vim.keymap.set('t', ';lr', 'lein run', { buffer = true })

        -- utils
        vim.keymap.set('t', ';ap', 'sudo apt update', { buffer = true })
        vim.keymap.set('t', ';ag', 'sudo apt upgrade', { buffer = true })
        vim.keymap.set('t', ';tr', 'tree -Ih node_modules', { buffer = true })
    end
})

-- Misc rempas
vim.keymap.set('n', '<leader>wd', function() vim.cmd.cd("%:h") end,
    { desc = 'Set [w]orking [d]irectory to current file' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [k]eymaps' })
vim.keymap.set('n', '<C-s>', ':w<Enter>', { desc = 'Write/Save' })
vim.keymap.set('n', '<leader>tv', ':vsp<Enter>:term<Enter>i', { desc = 'Start [Terminal] (in [V]ertical split)' })
vim.keymap.set('n', '<leader>th', ':sp<Enter>:term<Enter>i', { desc = 'Start [Terminal] (in [H]orizontal split)' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<Enter>a', { desc = 'Write/Save' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Back to Normal Mode' })

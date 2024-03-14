local conf_path = '/home/waseem/.config/nvim/'
local init_path = conf_path .. 'init.lua'

-- From kickstart
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- My remaps
vim.keymap.set('n', '<leader>rc', function() vim.cmd.edit(init_path) end, { desc = 'Edit vim[r][c]' })
vim.keymap.set('n', '<leader>wd', function() vim.cmd.cd("%:h") end,
    { desc = 'Set [w]orking [d]irectory to current file' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [k]eymaps' })
vim.keymap.set('n', '<C-s>', ':w<Enter>', { desc = 'Write/Save' })
vim.keymap.set('n', '<leader>tv', ':vsp<Enter>:term<Enter>i', { desc = 'Start [Terminal] (in [V]ertical split)' })
vim.keymap.set('n', '<leader>th', ':sp<Enter>:term<Enter>i', { desc = 'Start [Terminal] (in [H]orizontal split)' })
vim.keymap.set('n', '<leader>sp', ':set spell!<Enter>', { desc = 'Toggle [sp]ell checking' })
vim.keymap.set('n', '<leader>lr', ':LspRestart<Enter>', { desc = '[L]SP [R]estart' })
vim.keymap.set('n', '<leader>ss', ':e /tmp/scratch<Enter>', { desc = '[S]tart a [S]cratch buffer (tmp file)' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<Enter>a', { desc = 'Write/Save' })

-- Git remaps
local main_git_callback = function()
    vim.keymap.set('n', '<leader>gs', ":Git<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gd', ":Git diff", { buffer = true })
    vim.keymap.set('n', '<leader>gb', ":Git branch<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gl', ":Git log<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gps', ":Git push<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gpl', ":Git pull<Enter>", { buffer = true })
    -- vim.keymap.set('n', '<leader>ga', ":Git add .", { buffer = true })
    -- vim.keymap.set('n', '<leader>gc', ":Git commit<Enter>", { buffer = true })
end

local git_group = vim.api.nvim_create_augroup("GitGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = git_group,
    callback = main_git_callback
})

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

        -- clj
        vim.keymap.set('t', ';scw', 'npx shadow-cljs watch app', { buffer = true })
        vim.keymap.set('t', ';lr', 'lein run', { buffer = true })

        -- utils/other
        vim.keymap.set('t', ';ap', 'sudo apt update', { buffer = true })
        vim.keymap.set('t', ';ag', 'sudo apt upgrade', { buffer = true })
        vim.keymap.set('t', ';tr', 'tree -I node_modules --dirsfirst', { buffer = true })
        vim.keymap.set('t', ';hs', 'hugo server', { buffer = true })
        vim.keymap.set('t', ';gr', 'go run .', { buffer = true })
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Back to Normal Mode' })
    end
})

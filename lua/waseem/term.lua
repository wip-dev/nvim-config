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
        vim.keymap.set('t', ';tr', 'tree -Ih node_modules', { buffer = true })
        vim.keymap.set('t', ';hs', 'hugo server', { buffer = true })
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Back to Normal Mode' })
    end
})


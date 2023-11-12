local main_git_callback = function()
    vim.keymap.set('n', '<leader>gs', ":Git<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gd', ":Git diff", { buffer = true })
    vim.keymap.set('n', '<leader>gb', ":Git branch<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>ga', ":Git add .", { buffer = true })
    vim.keymap.set('n', '<leader>gc', ":Git commit<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gl', ":Git log<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gps', ":Git push<Enter>", { buffer = true })
    vim.keymap.set('n', '<leader>gpl', ":Git pull<Enter>", { buffer = true })
end

local git_group = vim.api.nvim_create_augroup("GitGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = git_group,
    callback = main_git_callback
})

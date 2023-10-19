local main_r_callback = function()
    -- Arrow and pipe operator remaps
    vim.keymap.set('i', "';", '<space><esc>gelcw<space><-', { buffer = true })
    vim.keymap.set('i', ";'", '<space><esc>gelcw<space>|>', { buffer = true })
end

local r_group = vim.api.nvim_create_augroup("RGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = r_group,
    pattern = { "*.r", "*.R" },
    callback = main_r_callback
})



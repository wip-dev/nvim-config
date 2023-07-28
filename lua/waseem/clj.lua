local conjure_log_group = vim.api.nvim_create_augroup("ConjureLogGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = conjure_log_group,
    pattern = "*conjure-log-\\d*.cljc",
    callback = function()
        vim.diagnostic.disable(0)
    end
})

